//
//  AddTaglinesViewController.h
//  TagLines
//
//  Created by Jasim Qazi on 11/20/11.
//  Copyright 2011 Folio3 (Pvt) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AddTaglinesViewController : BaseViewController <UITextViewDelegate> {
    
}

@property (nonatomic,strong) NSMutableData *responseData;

@end
