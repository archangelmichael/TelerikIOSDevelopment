//
//  TableViewCell.h
//  iEventApp
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *TitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *DescriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView *Avatar;
@end
