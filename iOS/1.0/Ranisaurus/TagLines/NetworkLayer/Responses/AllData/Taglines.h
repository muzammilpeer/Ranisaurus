//
//  Taglines.h
//
//  Created by Hussain Mansoor on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Taglines : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *taglinesIdentifier;
@property (nonatomic, strong) NSString *tagline;
@property (nonatomic, strong) NSString *howTo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
