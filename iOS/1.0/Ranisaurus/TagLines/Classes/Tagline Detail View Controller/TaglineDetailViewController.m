//
//  TaglineDetailViewController.m
//  TagLines
//
//  Created by Mubashir Ismail on 11/15/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import "TaglineDetailViewController.h"

@interface TaglineDetailViewController ()

@property (nonatomic, weak) IBOutlet UITextView * taglineTV, * howToUseTV;

@end

@implementation TaglineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.tagLine) {
        self.taglineTV.text = self.tagLine.tagline;
        self.howToUseTV.text = self.tagLine.taglineHowTo;
    }
}

@end
