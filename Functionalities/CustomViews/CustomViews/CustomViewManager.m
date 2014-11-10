//
//  CustomViewManager.m
//  CustomViews
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CustomViewManager.h"

@implementation CustomViewManager

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label.text = @"Changed Label";
    }
    return self;
}

- (void)didMoveToSuperview {
    self.label.text = @"SuperViewed Label";
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
