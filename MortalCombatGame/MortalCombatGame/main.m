//
//  main.m
//  MortalCombatGame
//
//  Created by Admin on 10/29/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
////#import "MKCastable.h"
//#import "Skill.h"
//#import "FireBall.h"
#import "Fighter.h"
#import "Subzero.h"
#import "Scorpio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSLog([[FireBall fireball] description]);
        //NSLog([[Skill skillWithName:@"Brutalizer" withDamage:20 withPower:10] description]);
        
        Subzero *one = [Subzero subzero];
        Scorpio *two = [Scorpio scorpio];
        NSLog(@"Duel begining: %@, %@", [one description], [two description]);
        
        [one kick:two];
        NSLog(@"Duel round 1: %@, %@", [one description], [two description]);
        
        [two kick:one];
        NSLog(@"Duel round 2: %@, %@", [one description], [two description]);
        
        [one punch:two];
        NSLog(@"Duel roudn 3: %@, %@", [one description], [two description]);
        
        [one useSkill:0 toHit:two];
        NSLog(@"Duel round 4: %@, %@", [one description], [two description]);
        
        [two kick:one];
        [two kick:one];
        [two useSkill:0 toHit:one];
        NSLog(@"Is %@ alive? %@", one.name, [one isAlive]);
        NSLog(@"Is %@ alive? %@", two.name, [one isAlive]);
        
        [one kick:two];
        [one punch:two];
        [one kick:two];
        [one punch:two];
        [one kick:two];
        [one useSkill:1 toHit:two];
        NSLog(@"Is %@ alive? %@", two.name, [two isAlive]);
        NSLog(@"DUEL WON BY: %@", [one description]);
        NSDate dsa;
    }
    return 0;
}
