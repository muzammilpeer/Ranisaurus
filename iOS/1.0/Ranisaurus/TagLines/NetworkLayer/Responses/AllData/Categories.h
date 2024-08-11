//
//  Categories.h
//
//  Created by Hussain Mansoor on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Categories : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *categoriesIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSArray *taglines;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
