//
//  Entry.h
//  Entries
//
//  Created by Daniel Bladh on 1/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSDate * timeStamp;

- (id)initWithDictionary: (NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;

@end
