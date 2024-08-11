//
//  Categories.m
//
//  Created by Hussain Mansoor on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Categories.h"
#import "Taglines.h"


NSString *const kCategoriesId = @"id";
NSString *const kCategoriesCategory = @"category";
NSString *const kCategoriesTaglines = @"taglines";


@interface Categories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Categories

@synthesize categoriesIdentifier = _categoriesIdentifier;
@synthesize category = _category;
@synthesize taglines = _taglines;


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
            self.categoriesIdentifier = [self objectOrNilForKey:kCategoriesId fromDictionary:dict];
            self.category = [self objectOrNilForKey:kCategoriesCategory fromDictionary:dict];
    NSObject *receivedTaglines = [dict objectForKey:kCategoriesTaglines];
    NSMutableArray *parsedTaglines = [NSMutableArray array];
    if ([receivedTaglines isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTaglines) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTaglines addObject:[Taglines modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTaglines isKindOfClass:[NSDictionary class]]) {
       [parsedTaglines addObject:[Taglines modelObjectWithDictionary:(NSDictionary *)receivedTaglines]];
    }

    self.taglines = [NSArray arrayWithArray:parsedTaglines];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoriesIdentifier forKey:kCategoriesId];
    [mutableDict setValue:self.category forKey:kCategoriesCategory];
    NSMutableArray *tempArrayForTaglines = [NSMutableArray array];
    for (NSObject *subArrayObject in self.taglines) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTaglines addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTaglines addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTaglines] forKey:kCategoriesTaglines];

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

    self.categoriesIdentifier = [aDecoder decodeObjectForKey:kCategoriesId];
    self.category = [aDecoder decodeObjectForKey:kCategoriesCategory];
    self.taglines = [aDecoder decodeObjectForKey:kCategoriesTaglines];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoriesIdentifier forKey:kCategoriesId];
    [aCoder encodeObject:_category forKey:kCategoriesCategory];
    [aCoder encodeObject:_taglines forKey:kCategoriesTaglines];
}

- (id)copyWithZone:(NSZone *)zone
{
    Categories *copy = [[Categories alloc] init];
    
    if (copy) {

        copy.categoriesIdentifier = [self.categoriesIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.taglines = [self.taglines copyWithZone:zone];
    }
    
    return copy;
}


@end
