//
//  ArtistsCell.h
//  YSLContainerViewControllerDemo
//
//  Created by yamaguchi on 2015/03/25.
//  Copyright (c) 2015年 h.yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSLJobCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *artWorkImageView;
@property (nonatomic, strong) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDescription;

@end
