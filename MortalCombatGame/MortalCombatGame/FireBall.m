//
//  FireBall.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "FireBall.h"

@implementation FireBall

-(instancetype) init {
    self = [super initWithName:@"Fireball" withDamage: 30 withPower: 20];
    return self;
}

+(instancetype) fireball {
    return [[self alloc] init];
}


@end
