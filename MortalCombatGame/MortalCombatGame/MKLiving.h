//
//  MKLiving.h
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

@protocol MKLiving

@property NSString *name;
@property int health;
@property int power;

-(NSString *) isAlive;
@end
