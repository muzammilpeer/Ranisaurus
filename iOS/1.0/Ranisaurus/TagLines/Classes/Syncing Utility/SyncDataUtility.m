//
//  SyncDataUtility.m
//  TagLines
//
//  Created by Mubashir Ismail on 11/14/11.
//  Copyright 2011 iHusyn.com All rights reserved.
//

#import "SyncDataUtility.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

#import "MagicalRecord.h"
#import "TaglineEntity.h"
#import "CategoryEntity.h"

#import "Categories.h"
#import "CategoryData.h"
#import "Taglines.h"

@implementation SyncDataUtility

#pragma mark - Class Methods

- (void) getAllCategoriesData {
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showInfoWithStatus:@"Loading new taglines..."];
    
    NSString *urlString = @"http://ranisaurus.com/webservice/webservice.php?action=getall";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        CategoryData *response = [[CategoryData alloc] initWithDictionary:responseObject];
        if ([response.code isEqualToString:@"1"]) {

            for (Categories *category in response.categories) {

                CategoryEntity *categoryEntity = [[CategoryEntity MR_findByAttribute:@"categoryId" withValue:category.categoriesIdentifier] firstObject];
                if (categoryEntity == nil) {
                    categoryEntity = [CategoryEntity MR_createEntity];
                }
                categoryEntity.categoryId = category.categoriesIdentifier;
                categoryEntity.name       = category.category;

                for (Taglines *tagline in category.taglines) {
                    
                    TaglineEntity *taglineEntity = [[TaglineEntity MR_findByAttribute:@"taglineId" withValue:tagline.taglinesIdentifier] firstObject];
                    if (taglineEntity == nil) {
                        taglineEntity = [TaglineEntity MR_createEntity];
                    }
                    NSString *taglineText = tagline.tagline;
                    
                    //remove quotation from start and end of the tagline string
                    if ([taglineText hasPrefix:@"\""]) {
                        taglineText = [taglineText substringFromIndex:1];
                    }
                    if ([taglineText hasSuffix:@"\""]) {
                        taglineText = [taglineText substringToIndex:[taglineText length]-1];
                    }
                    
                    taglineEntity.taglineId     = tagline.taglinesIdentifier;
                    taglineEntity.tagline       = taglineText;
                    taglineEntity.categoryId    = category.categoriesIdentifier;
                    taglineEntity.taglineHowTo  = tagline.howTo;
                }//tagline
                
            }//categories
        }
        
        [self saveContext];
        
        //Notify UI that insertion is updated
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"YES" forKey:kUserDefaults_DataSynced];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_DataSynced object:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //get remaining categories data even in case of failure
        NSLog(@"Error in getting categories: %@",[error description]);
    }];
    
}

- (void)saveContext {
    @try {
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"You successfully saved your context.");
            } else if (error) {
                NSLog(@"Error saving context: %@", error.description);
            }
        }];
    }@catch (NSException *ex) {
        NSLog(@"Exception: %@",[ex description]);
    }
}

/*
- (void) getTaglineDataWithCategoryIndex:(NSInteger)index
{
    if(index >= [categoriesArray count])
    {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"YES" forKey:kUserDefaults_DataSynced];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_DataSynced object:nil];
        return;
    }

    NSDictionary *categoryDict = [categoriesArray objectAtIndex:index];
    NSString *string = [NSString stringWithFormat:@"http://ranisaurus.com/webservice/webservice.php?action=gettagline&categoryid=%@", [categoryDict objectForKey:@"id"]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *infoDictionary = [[NSMutableDictionary alloc] init];
        
        NSDictionary *categoryDict = [categoriesArray objectAtIndex:categoryIndex];
        [infoDictionary setObject:[categoryDict objectForKey:@"id"] forKey:@"CATEGORY_ID"];
        [infoDictionary setObject:[categoryDict objectForKey:@"category"] forKey:@"CATEGORY_NAME"];
        
        NSArray *taglinesArray = [NSArray arrayWithArray:[responseObject objectForKey:@"taglines"]];
        if([taglinesArray count] > 0)
        {
            [infoDictionary setObject:taglinesArray forKey:@"CATEGORY_TAGLINES_ARRAY"];
        }
        
        categoryIndex++;
        [self getTaglineDataWithCategoryIndex:categoryIndex];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
*/

@end
