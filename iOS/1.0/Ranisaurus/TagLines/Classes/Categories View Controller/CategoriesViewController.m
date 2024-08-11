//
//  CategoriesViewController.m
//  TagLines
//
//  Created by Mubashir Ismail on 11/15/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import "CategoriesViewController.h"
#import "TaglinesViewController.h"
#import "SWTableViewCell.h"
#import "CategoriesCell.h"
#import "SVPullToRefresh.h"

@interface CategoriesViewController () <UITableViewDelegate, UITableViewDataSource,SWTableViewCellDelegate,UISearchBarDelegate, UISearchDisplayDelegate> {
    
    IBOutlet UITableView *   categoriesTableView;
    NSMutableArray *         categoriesArray;//dataset for table
    CategoryEntity *         selectedCategory;//for segue
    NSIndexPath *            deleteIndexPath;//for swipe cell delete index
}

    //search functionality
@property (strong,nonatomic) NSMutableArray *   filteredCandyArray;
@property IBOutlet UISearchBar *                categoriesSearchBar;

@end

@implementation CategoriesViewController

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataSyncedNotificationReceived) name:kNotification_DataSynced object:nil];
    
    if (![userDefaults objectForKey:kUserDefaults_DataSynced])
    {
        SyncDataUtility *syncDataUtility = [[SyncDataUtility alloc] init];
        [syncDataUtility getAllCategoriesData];
    }
    categoriesArray = [[NSMutableArray alloc] initWithArray:[CategoryEntity MR_findAllSortedBy:@"name" ascending:YES]];
    
    [categoriesTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    __weak CategoriesViewController * weakSelf = self;
    [categoriesTableView addPullToRefreshWithActionHandler:^{
        // append data to data source, insert new cells at the end of table view
        [weakSelf refreshCatagoryData:nil];
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([TaglinesViewController class] == [[segue destinationViewController] class]) {
        TaglinesViewController *vc = [segue destinationViewController];
        [vc setCategory:selectedCategory];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Categories";
    [categoriesTableView reloadData];
}

#pragma mark - Class Methods

- (IBAction)refreshCatagoryData:(id)sender
{
    //delete all data from coredata
    [self deleteAllData];

    SyncDataUtility *syncDataUtility = [[SyncDataUtility alloc] init];
    [syncDataUtility getAllCategoriesData];
}

- (void) dataSyncedNotificationReceived
{
    [categoriesTableView.pullToRefreshView  stopAnimating];
    [categoriesArray                        removeAllObjects];
    [categoriesArray                        addObjectsFromArray:[CategoryEntity MR_findAllSortedBy:@"name" ascending:YES]];
    [categoriesTableView                    reloadData];
    [SVProgressHUD                          dismiss];
}

#pragma mark - Table view data source

- (NSArray *)rightCellButtons//delete button
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:tnbRed title:@"Delete"];
    return rightUtilityButtons;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [categoriesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoryCell";
    
    CategoriesCell *cell = (CategoriesCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CategoriesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    __weak id weakSelf = self;
    [cell setDelegate:weakSelf];
    cell.leftUtilityButtons = [self rightCellButtons];
    
    @try {
        // Configure the cell...
        CategoryEntity *categories = (CategoryEntity*)[categoriesArray objectAtIndex:indexPath.row];
        [cell.textLabel setText:categories.name];
    }
    @catch (NSException *exception) {
        NSLog(@"%s Exception %@",__PRETTY_FUNCTION__, [exception description]);
    }
    @finally {
        return cell;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];    
    
    selectedCategory = [categoriesArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"TaglinesSegue" sender:nil];
    
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0: {
            deleteIndexPath = [categoriesTableView indexPathForCell:cell];
            CategoryEntity *data = (CategoryEntity *) [categoriesArray objectAtIndex:deleteIndexPath.row];
            [self removeCategory:data];
        }
            break;

        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    if (kCellStateLeft == state) {
        return YES;
    }
    else {
        return NO;
    }
}

-(void) removeCategory: (CategoryEntity *) categoryEntity {
    
    [categoryEntity MR_deleteEntity];
    NSArray *taglinesOfCategory = [TaglineEntity MR_findByAttribute:@"categoryId" withValue:categoryEntity.categoryId];
    [taglinesOfCategory makeObjectsPerformSelector:@selector(MR_deleteEntity)];
    
    [self saveContext];
    [categoriesArray removeObjectAtIndex:deleteIndexPath.row];
    [categoriesTableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Search Bar Delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [searchResultsArray removeAllObjects];
    
    for(int i = 0; i < [categoriesArray count]; i++)
    {
        CategoryEntity *categories = [categoriesArray objectAtIndex:i];
        NSMutableArray *categoryTaglines = [[NSMutableArray alloc] initWithArray:[TaglineEntity MR_findByAttribute:@"categoryId" withValue:categories.categoryId]];
        [searchResultsArray addObjectsFromArray:[categoryTaglines filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"tagline CONTAINS[cd] %@", searchText]]];
    }
    
    [searchTableView reloadData];
}


@end
