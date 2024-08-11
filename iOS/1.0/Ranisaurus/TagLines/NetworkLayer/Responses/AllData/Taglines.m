//
//  Taglines.m
//
//  Created by Hussain Mansoor on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Taglines.h"


NSString *const kTaglinesId = @"id";
NSString *const kTaglinesTagline = @"tagline";
NSString *const kTaglinesHowTo = @"howTo";


@interface Taglines ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Taglines

@synthesize taglinesIdentifier = _taglinesIdentifier;
@synthesize tagline = _tagline;
@synthesize howTo = _howTo;


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
            self.taglinesIdentifier = [self objectOrNilForKey:kTaglinesId fromDictionary:dict];
            self.tagline = [self objectOrNilForKey:kTaglinesTagline fromDictionary:dict];
            self.howTo = [self objectOrNilForKey:kTaglinesHowTo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taglinesIdentifier forKey:kTaglinesId];
    [mutableDict setValue:self.tagline forKey:kTaglinesTagline];
    [mutableDict setValue:self.howTo forKey:kTaglinesHowTo];

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

    self.taglinesIdentifier = [aDecoder decodeObjectForKey:kTaglinesId];
    self.tagline = [aDecoder decodeObjectForKey:kTaglinesTagline];
    self.howTo = [aDecoder decodeObjectForKey:kTaglinesHowTo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_taglinesIdentifier forKey:kTaglinesId];
    [aCoder encodeObject:_tagline forKey:kTaglinesTagline];
    [aCoder encodeObject:_howTo forKey:kTaglinesHowTo];
}

- (id)copyWithZone:(NSZone *)zone
{
    Taglines *copy = [[Taglines alloc] init];
    
    if (copy) {

        copy.taglinesIdentifier = [self.taglinesIdentifier copyWithZone:zone];
        copy.tagline = [self.tagline copyWithZone:zone];
        copy.howTo = [self.howTo copyWithZone:zone];
    }
    
    return copy;
}


@end
