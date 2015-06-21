//
//  YSLDetailViewController.h
//  BACE Time
//
//  Created by Romy on 6/19/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface YSLDetailViewController : UIViewController

@property (strong, nonatomic) PFObject *pfObject;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UILabel *testLabel;

@end
