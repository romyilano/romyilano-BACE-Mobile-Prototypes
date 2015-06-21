//
//  YSLJobDetailViewController.h
//  BACE Time
//
//  Created by Romy on 6/19/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaceJob;
@interface YSLJobDetailViewController : UIViewController

@property (strong, nonatomic) BaceJob *baceJobObj;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *jobHeaderOne;
@property (weak, nonatomic) IBOutlet UILabel *jobDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *takeJobButton;

- (IBAction)btnPressed:(UIButton *)sender;

@end
