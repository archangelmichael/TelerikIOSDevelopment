//
//  Thing.h
//  CustomTableViewWithBackOption
//
//  Created by Admin on 11/3/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

enum category {
    vehicles,
    parts,
    accessories
};

@interface Thing : NSObject
@property (nonatomic) enum category category;
@property (nonatomic) NSString * title;
@property (nonatomic) NSString * info;

-(instancetype)init;
-(instancetype)initWithTitle:(NSString *)title
             withDescription:(NSString *)info
                withCategory:(enum category)category;
+(instancetype)thing;
+(instancetype)thingWithTitle:(NSString *)title
              withDescription:(NSString *)info
                 withCategory:(enum category)category;

@end
