//
//  MKFighting.h
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

@protocol MKFighting

@property NSArray * skillset;

- (void)punch:(id)opponent;
- (void)kick:(id)opponent;
- (void)useSkill:(id)skill
           toHit:(id)opponent;

@end

