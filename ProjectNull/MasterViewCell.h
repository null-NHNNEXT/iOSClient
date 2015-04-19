//
//  MasterViewCell.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 20..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentDigest;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
