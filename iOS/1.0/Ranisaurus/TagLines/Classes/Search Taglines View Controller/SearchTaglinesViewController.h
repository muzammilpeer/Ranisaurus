//
//  SearchTaglinesViewController.h
//  TagLines
//
//  Created by Mubashir Ismail on 11/15/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SearchTaglinesViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate> {
    
    UITableView* searchTableView;
    UISearchBar *searchBar;
    NSMutableArray* categoriesArray;
    NSMutableArray* searchResultsArray;
}

@end
