//
//  Skill.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Skill.h"

@implementation Skill

const int DEFAULT_SKILL_DAMAGE = 20;
const int DEFAULT_SKILL_POWER = 20;

+ (instancetype)skillWithName:(NSString *)skillname
                   withDamage:(int)skilldamage
                    withPower:(int)skillpower {
    return [[self alloc] initWithName:skillname withDamage:skilldamage withPower:skillpower];
}

-(instancetype) init {
    return [self initWithName:@"Scare" withDamage:DEFAULT_SKILL_DAMAGE withPower:DEFAULT_SKILL_POWER];
}


// Designated initializer.
- (instancetype)initWithName:(NSString *) skillname
                  withDamage:(int) skilldamage
                   withPower:(int) skillpower{
    self = [super init];
    if (self) {
        _name = skillname;
        _damage = skilldamage;
        _power = skillpower;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@" %@ dealing %i", self.name, self.damage];
}
@end
