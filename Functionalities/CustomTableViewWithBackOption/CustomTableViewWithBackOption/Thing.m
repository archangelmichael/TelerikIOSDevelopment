//
//  Thing.m
//  CustomTableViewWithBackOption
//
//  Created by Admin on 11/3/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Thing.h"

@implementation Thing

-(instancetype)init {
    return [self initWithTitle:@"No Title" withDescription:@"No info" withCategory:vehicles];
}
-(instancetype)initWithTitle:(NSString *)title
             withDescription:(NSString *)info
                withCategory:(enum category)category {
    self = [super init];
    if (self) {
        self.title = title;
        self.info = info;
        self.category = category;
    }
    return self;
}

+(instancetype)thing {
    return [[Thing alloc] initWithTitle:@"No Title" withDescription:@"No info" withCategory:vehicles];
}
+(instancetype)thingWithTitle:(NSString *)title
              withDescription:(NSString *)info
                 withCategory:(enum category)category {
    return [[Thing alloc] initWithTitle:title withDescription:info withCategory:category];
}


@end
