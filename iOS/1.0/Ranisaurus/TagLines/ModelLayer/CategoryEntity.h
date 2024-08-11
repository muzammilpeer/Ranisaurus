//
//  CategoryEntity.h
//  TagLines
//
//  Created by Hussain Mansoor on 8/29/15.
//  Copyright (c) 2015 Folio3 (Pvt) Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CategoryEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * categoryId;

@end
