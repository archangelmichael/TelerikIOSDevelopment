//
//  Scorpio.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Scorpio.h"
#import "Bomb.h"
#import "FlyKick.h"

@implementation Scorpio

-(instancetype) init {
    self = [super initWithName:@"Scorpio"];
    if (self) {
        NSArray *skills = @[ [Bomb bomb],
                             [FlyKick flykick]
                             ];
        self.skillset = skills;
    }
    return self;
}

+(instancetype) scorpio {
    return [[self alloc] init];
}


@end
