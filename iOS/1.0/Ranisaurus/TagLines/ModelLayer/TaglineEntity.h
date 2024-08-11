//
//  TaglineEntity.h
//  TagLines
//
//  Created by Hussain Mansoor on 8/29/15.
//  Copyright (c) 2015 Folio3 (Pvt) Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TaglineEntity : NSManagedObject

@property (nonatomic, retain) NSString * tagline;
@property (nonatomic, retain) NSString * taglineId;
@property (nonatomic, retain) NSString * categoryId;
@property (nonatomic, retain) NSString * taglineHowTo;

@end
