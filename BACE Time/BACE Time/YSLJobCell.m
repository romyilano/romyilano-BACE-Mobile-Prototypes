//
//  ArtistsCell.m
//  YSLContainerViewControllerDemo
//
//  Created by yamaguchi on 2015/03/25.
//  Copyright (c) 2015年 h.yamaguchi. All rights reserved.
//

#import "YSLJobCell.h"
#import "BACEUtility.h"

@implementation YSLJobCell

- (void)awakeFromNib {
    // Initialization code
    self.jobLabel.textAlignment = NSTextAlignmentLeft;
    self.jobLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.jobLabel.numberOfLines = 1;
    self.jobLabel.font = [BACEUtility baceCellFont];
    
    self.jobDescription.textAlignment = NSTextAlignmentLeft;
    self.jobDescription.lineBreakMode = NSLineBreakByWordWrapping;
    self.jobDescription.font = [BACEUtility secondaryCellFont];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
