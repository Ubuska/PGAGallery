//
//  BaseObject+Parsing.h
//  Gallery
//
//  Created by Peter Gubin on 04/05/16.
//  Copyright © 2016 Peter Gubin. All rights reserved.
//

#import "BaseObject.h"

@interface BaseObject (Parsing)

- (instancetype)initWithDictionary:(NSDictionary *)values;
- (void)updateWithDictionary:(NSDictionary *)values;

//+ (NSArray*)keysForDataParsing;

@end
