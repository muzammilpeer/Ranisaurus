//
//  SearchTaglinesViewController.m
//  TagLines
//
//  Created by Mubashir Ismail on 11/15/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import "SearchTaglinesViewController.h"


@implementation SearchTaglinesViewController



#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    categoriesArray = [[NSMutableArray alloc] initWithArray:[CategoryEntity MR_findAll]];
    searchResultsArray = [[NSMutableArray alloc] init];
    
    searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0,
                                                                        0.0,
                                                                        self.view.frame.size.width,
                                                                        self.view.frame.size.height - 44.0 - 49.0) style:UITableViewStylePlain];
    searchTableView.backgroundColor = [UIColor clearColor];
    [searchTableView setDelegate:self];
    [searchTableView setDataSource:self];
    searchTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:searchTableView];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 44.0)];
    searchBar.delegate = self;
    [searchBar sizeToFit];
    [searchBar setBarStyle:UIBarStyleBlack];
    
    UISearchDisplayController *uiSearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    uiSearchDisplayController.delegate = self;
    uiSearchDisplayController.searchResultsDataSource = self;
    uiSearchDisplayController.searchResultsDelegate = self;
    [searchTableView setTableHeaderView:uiSearchDisplayController.searchBar];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [searchResultsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        cell.backgroundColor = [UIColor yellowColor];
        //cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    @try {
        // Configure the cell...
        TaglineEntity *tagLine = (TaglineEntity*)[searchResultsArray objectAtIndex:indexPath.row];
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
    [searchResultsArray objectAtIndex:indexPath.row];
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
