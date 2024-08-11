//
//  BaseViewController.m
//  MyTNB
//
//  Created by Hussain Mansoor on 5/26/15.
//  Copyright (c) 2015 GoodCoreSoft. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setBarTintColor:tnbRed];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tempTitle = self.title;
    self.title = @"";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (self.tempTitle && ![self.tempTitle isEqualToString:@""]) {
        self.title = self.tempTitle;
    }
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:buttonTitle
                               style:UIAlertActionStyleCancel
                               handler:nil];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)saveContext {
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"You successfully saved your context.");
        } else if (error) {
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
}

- (void) deleteAllData {
    //this should delete all the categories
    for (CategoryEntity *entity in [CategoryEntity MR_findAll]) {
        [entity MR_deleteEntity];
    }
    //delete all taglines
    for (TaglineEntity *taglineEntity in [TaglineEntity MR_findAll]) {
        [taglineEntity MR_deleteEntity];
    }
}

@end
