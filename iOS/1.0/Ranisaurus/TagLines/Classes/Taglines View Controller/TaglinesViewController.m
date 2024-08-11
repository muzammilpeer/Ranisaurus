//
//  TaglinesViewController.m
//  TagLines
//
//  Created by Mubashir Ismail on 11/15/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import "TaglinesViewController.h"
#import "TaglineDetailViewController.h"
#import "SWTableViewCell.h"
#import "TaglineCell.h"

@interface TaglinesViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView* taglinesTableView;
    NSMutableArray* taglinesArray;
    NSIndexPath         *deleteIndexPath;
}

@property (nonatomic, strong) TaglineEntity * selectedTagline;

@end

@implementation TaglinesViewController

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Taglines";
    
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    self.navigationController.navigationBar.backItem.backBarButtonItem.title = @"Categories";
    
    if (self.category) {
        taglinesArray = [[NSMutableArray alloc] initWithArray:[TaglineEntity MR_findByAttribute:@"categoryId" withValue:self.category.categoryId]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([TaglineDetailViewController class] == [[segue destinationViewController] class]) {
        TaglineDetailViewController *vc = [segue destinationViewController];
        [vc setTagLine:self.selectedTagline];
    }
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
    return [taglinesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaglineCell";
    
    TaglineCell *cell = (TaglineCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TaglineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    __weak id weakSelf = self;
    [cell setDelegate:weakSelf];
    cell.leftUtilityButtons = [self rightCellButtons];
    
    @try {
        // Configure the cell...
        TaglineEntity *tagLine = (TaglineEntity*)[taglinesArray objectAtIndex:indexPath.row];
        [cell.textLabel setText:tagLine.tagline];
    }
    @catch (NSException *exception) {
        NSLog(@"%s Exception %@",__func__, [exception description]);
    }
    @finally {
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.selectedTagline = [taglinesArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"TaglineDetailsSegue" sender:nil];
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0: {
            deleteIndexPath = [taglinesTableView indexPathForCell:cell];
            TaglineEntity *data = (TaglineEntity *) [taglinesArray objectAtIndex:deleteIndexPath.row];
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


-(void) removeCategory: (TaglineEntity *) categoryEntity {
    
    [categoryEntity MR_deleteEntity];
    [self saveContext];
    [taglinesArray removeObjectAtIndex:deleteIndexPath.row];
    [taglinesTableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
