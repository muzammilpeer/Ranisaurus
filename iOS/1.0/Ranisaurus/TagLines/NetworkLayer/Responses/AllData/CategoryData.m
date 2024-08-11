//
//  CategoryData.m
//
//  Created by Hussain Mansoor on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CategoryData.h"
#import "Categories.h"


NSString *const kCategoryDataMsg = @"msg";
NSString *const kCategoryDataCategories = @"categories";
NSString *const kCategoryDataCode = @"code";


@interface CategoryData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryData

@synthesize msg = _msg;
@synthesize categories = _categories;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kCategoryDataMsg fromDictionary:dict];
    NSObject *receivedCategories = [dict objectForKey:kCategoryDataCategories];
    NSMutableArray *parsedCategories = [NSMutableArray array];
    if ([receivedCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategories addObject:[Categories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategories isKindOfClass:[NSDictionary class]]) {
       [parsedCategories addObject:[Categories modelObjectWithDictionary:(NSDictionary *)receivedCategories]];
    }

    self.categories = [NSArray arrayWithArray:parsedCategories];
            self.code = [self objectOrNilForKey:kCategoryDataCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCategoryDataMsg];
    NSMutableArray *tempArrayForCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategories] forKey:kCategoryDataCategories];
    [mutableDict setValue:self.code forKey:kCategoryDataCode];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.msg = [aDecoder decodeObjectForKey:kCategoryDataMsg];
    self.categories = [aDecoder decodeObjectForKey:kCategoryDataCategories];
    self.code = [aDecoder decodeObjectForKey:kCategoryDataCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCategoryDataMsg];
    [aCoder encodeObject:_categories forKey:kCategoryDataCategories];
    [aCoder encodeObject:_code forKey:kCategoryDataCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryData *copy = [[CategoryData alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.categories = [self.categories copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
