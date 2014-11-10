//
//  TeleportPunch.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TeleportPunch.h"

@implementation TeleportPunch

-(instancetype) init {
    self = [super initWithName:@"TeleportPunch" withDamage: 50 withPower: 50];
    return self;
}

+(instancetype) teleportpunch {
    return [[self alloc] init];
}

@end
