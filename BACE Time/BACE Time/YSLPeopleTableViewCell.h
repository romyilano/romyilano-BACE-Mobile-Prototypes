//
//  YSLPeopleTableViewCell.h
//  BACE Time
//
//  Created by Romy on 6/19/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSLPeopleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *personDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
