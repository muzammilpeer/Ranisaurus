//
//  BaseViewController.h
//  MyTNB
//
//  Created by Hussain Mansoor on 5/26/15.
//  Copyright (c) 2015 GoodCoreSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SVProgressHUD.h"
#import "MagicalRecord.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) NSString * tempTitle;

/**
 *  Utility method to show alerts from VC classes
 *
 *  @param title       Title of alert view
 *  @param message     message of alert view
 *  @param buttonTitle single button title to cancel alert
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle;
- (void)saveContext;
- (void) deleteAllData;
@end
