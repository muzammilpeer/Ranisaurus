//
//                                                                                                                                   Constants.h
//
//  Created by Hussain Mansoor on                                                                                                    30/03/2014.
//  Copyright (c) 2014. All rights                                                                                                   reserved.
//


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_IPHONE_4 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON                 )
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON                 )
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) <                                         DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) <                                    DBL_EPSILON)
#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >=                                                5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >=                                                6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >=                                                7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >=                                                8.0)

//macros to easily fix frame of                                                                                                      UIViews
#define pointX(_object)                                                                                                              _object.frame.origin.x
#define pointY(_object)                                                                                                              _object.frame.origin.y
#define width(_object)                                                                                                               _object.frame.size.width
#define height(_object)                                                                                                              _object.frame.size.height

//Macro for color theme
#define tnbBlue [UIColor colorWithRed:0.12 green:0.53 blue:0.87 alpha:1.0]
#define tnbRed  [UIColor colorWithRed:0.87 green:0.2 blue:0.08 alpha:1.0]
#define tnbGray [UIColor colorWithWhite:0.9 alpha:1.0]

#define REGEX_FOR_NUMBERS   @"^([+-]?)(?:|0|[0-9]\\d*)(?:\\.\\d*)?$"

#define IS_A_NUMBER(string) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_FOR_NUMBERS] evaluateWithObject:string]

#pragma mark - App Constants
extern NSInteger const kApp_ErrorInternetNotAvailable;

#pragma mark - URL constants

extern NSString *const kURL_base;


#pragma mark - UI                                                                                                                    constants
extern NSString *const kUI_MainNavController;


#pragma mark - Storyboard Names
extern NSString *const kStoryBoard_MyBills;
extern NSString *const kStoryBoard_Energy;

#pragma mark - UserDefaultsKeys

extern NSString *const kUserDefaults_DataSynced;
extern NSString *const kNotification_DataSynced;
//extern NSString *const kUserDefaults_;



