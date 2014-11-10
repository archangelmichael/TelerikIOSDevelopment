//
//  Event.h
//  EventLibrary
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (readonly) NSString *title, *category, *info;
@property (readonly) NSDate * date;
@property (readonly) NSMutableArray * guests;

-(id) initWithTitle:(NSString *) title
           category:(NSString *) category
        description:(NSString *) info
               date:(NSDate *) date;

-(void) addGuest: (NSString *) name;
-(void) addGuests:(NSArray *) guestnames;
@end
