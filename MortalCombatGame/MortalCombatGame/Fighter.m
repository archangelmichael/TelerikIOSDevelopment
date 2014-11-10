//
//  Fighter.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Fighter.h"

@implementation Fighter

+ (instancetype)fighterWithName:(NSString *)fighterName {
    return [[self alloc] initWithName:fighterName];
}

- (instancetype)init {
    return [self initWithName:@"MasterNinja"];
}

- (instancetype)initWithName:(NSString *)fighterName {
    self = [super init];
    if (self) {
        self.name = fighterName;
        self.health = 200;
        self.power = 0;
        self.skillset = [[NSArray alloc] init];
    }
    return self;
}

- (void)punch:(Fighter *)opponent {
    NSLog(@"%@ Punched %@!", self.name, opponent.name);
    self.power+= 30;
    opponent.health -= 5;
    
}

- (void)kick:(Fighter *)opponent {
    NSLog(@"%@ Kicked %@!", self.name, opponent.name);
    self.power+= 40;
    opponent.health -= 10;
}

- (void)useSkill:(int)skillNumber
           toHit:(Fighter *)opponent {
    if (self.skillset.count > skillNumber) {
        Skill *skill = self.skillset[skillNumber];
        if (skill.power > self.power) {
            NSLog(@"%@ has no enough power to use %@!", self.name, skill.name);
        } else {
            NSLog(@"%@ used %@ to %@!", self.name, [skill description], opponent.name);
            
            [opponent reduceHealth:skill.damage];
            self.power -= skill.power;
        }
    } else {
        NSLog(@"%@ has no such skill!", self.name);
    }
}

- (void)reduceHealth:(int) value {
    self.health -= value;
    if (self.health < 0) {
        self.health = 0;
    }
}

- (NSString *)isAlive {
    if(self.health <= 0) {
        return @"NO";
    } else {
        return @"YES";
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Fighter: %@, Health: %i, Power: %i", self.name, self.health, self.power];
}

@end
