//
//  Skill.h
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKCastable.h"

@interface Skill : NSObject <MKCastable>

@property int damage;
@property int power;
@property (nonatomic, strong) NSString *name;

+ (instancetype)skillWithName:(NSString *) skillname
                   withDamage:(int) skilldamage
                    withPower:(int) skillpower;

- (instancetype)initWithName:(NSString *) skillname
                  withDamage:(int) skilldamage
                   withPower:(int) skillpower;
@end
