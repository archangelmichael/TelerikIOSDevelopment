//
//  List.h
//  ListManagement
//
//  Created by Admin on 11/2/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface List : NSObject

@property (nonatomic) NSString *listTitle;
@property (nonatomic) NSString *listCategory;
@property (nonatomic) NSMutableArray *listNotes;
-(instancetype)init;
-(instancetype)initWithTitle:(NSString*)title
                withCategory:(NSString*)category;
-(instancetype)initWithTitle:(NSString*)title
                withCategory:(NSString*)category
                   withNotes:(NSArray*)notes;

+(instancetype)list;
+(instancetype)listWithTitle:(NSString*)title
                withCategory:(NSString*)category;
+(instancetype)listWithTitle:(NSString*)title
                withCategory:(NSString*)category
                   withNotes:(NSArray*)notes;

-(Note*)getNoteByIndex:(NSInteger)index;
    
-(void) addNotes:(NSArray *)notes;

-(void) addNote:(Note *)note;

-(void) removeNote:(Note *)note;
@end
