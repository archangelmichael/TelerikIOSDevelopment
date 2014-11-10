//
//  Note.h
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (nonatomic) NSString *noteTitle;
@property (nonatomic) NSString *noteDescription;
@property (nonatomic) NSDate *noteDate;

-(instancetype)init;
-(instancetype)initWithTitle:(NSString*)title
             withDescription:(NSString*)description;
-(instancetype)initWithTitle:(NSString *)title
             withDescription:(NSString *)description
                    withDate:(NSDate *)date;

+(instancetype)note;
+(instancetype)noteWithTitle:(NSString*)title
             withDescription:(NSString*)description;
+(instancetype)noteWithTitle:(NSString *)title
             withDescription:(NSString *)description
                    withDate:(NSDate *)date;
@end
