//
//  Subzero.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Subzero.h"
#import "TeleportPunch.h"
#import "Brutilizer.h"

@implementation Subzero

-(instancetype) init {
    self = [super initWithName:@"Subzero"];
    if (self) {
        NSArray *skills = @[ [TeleportPunch teleportpunch],
                            [Brutilizer brutalizer]
                            ];
        self.skillset = skills;
    }
    return self;
}

+(instancetype) subzero {
    return [[self alloc] init];
}

@end
