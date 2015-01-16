//
//  Entry.m
//  Entries
//
//  Created by Daniel Bladh on 1/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.text = [dictionary objectForKey:@"text"];
        self.timeStamp = [dictionary objectForKey:@"timeStamp"];
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    NSMutableDictionary * mutableEntry = [NSMutableDictionary dictionary];
    if (self.title) {
        [mutableEntry setValue:self.title forKey:@"title"];
    }
    if (self.text) {
        [mutableEntry setValue:self.text forKey:@"text"];
    }
    if (self.timeStamp){
        [mutableEntry setValue:self.timeStamp forKey:@"timeStamp"];
    }
    return mutableEntry;
}

@end
