//
//  Fighter.h
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKFighting.h"
#import "MKLiving.h"
#import "Skill.h"
@interface Fighter : NSObject <MKFighting, MKLiving>

@property NSString *name;
@property int health;
@property int power;
@property NSArray * skillset;

+ (instancetype)fighterWithName:(NSString *)fighterName;
- (instancetype)initWithName:(NSString *)fighterName;

- (NSString *)isAlive;
- (void)punch:(id)opponent;
- (void)kick:(id)opponent;
- (void)useSkill:(int)skillNumber
           toHit:(id)opponent;
@end
