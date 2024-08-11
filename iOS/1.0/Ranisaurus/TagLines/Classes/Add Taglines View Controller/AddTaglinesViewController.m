//
//  AddTaglinesViewController.m
//  TagLines
//
//  Created by Jasim Qazi on 11/20/11.
//  Copyright 2011 Folio3 (Pvt) Ltd. All rights reserved.
//

#import "AddTaglinesViewController.h"
#import "AFNetworking.h"

@interface AddTaglinesViewController ()

@property (nonatomic, weak) IBOutlet UITextView *taglineTextView;
@property (nonatomic, weak) IBOutlet UITextView *taglineHowToTextView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *barButton;


@end

@implementation AddTaglinesViewController

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add Taglines";
    self.navigationItem.rightBarButtonItem = self.barButton;
}

#pragma mark - Class Methods

- (IBAction) barButtonAction:(id)sender
{
    
    if([self.taglineTextView.text length] > 0 && [self.taglineHowToTextView.text length] > 0)
    {
        
        self.responseData = [[NSMutableData alloc] init];
        
        NSString *urlString = [NSString stringWithFormat:@"http://ranisaurus.com/webservice/webservice.php?action=addtagline&tagline=%@&howto=%@", self.taglineTextView.text, self.taglineHowToTextView.text];
//        NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if([[responseObject objectForKey:@"msg"] isEqualToString:@"Successful"])
            {
                [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Successfully submitted to admin" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
                
                [self.taglineTextView setText:@""];
                [self.taglineHowToTextView setText:@""];
            }
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Your request could not be completed successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertView show];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incomplete" message:@"Please provide text for both fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
}

@end
