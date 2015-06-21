//
//  YSLDetailViewController.m
//  BACE Time
//
//  Created by Romy on 6/19/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "YSLDetailViewController.h"
#import "BACEUser.h"
#import "BaceJob.h"

@interface YSLDetailViewController ()
// gray overlay
@property (strong, nonatomic) UIView *greyCoverView;
@end

@implementation YSLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.backgroundImageView.frame = [UIScreen mainScreen].bounds;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundImageView.image = [UIImage imageNamed:@"machine"];
    [self.view addSubview:self.backgroundImageView];

    self.greyCoverView = [[UIView alloc] initWithFrame:self.view.frame];
    self.greyCoverView.backgroundColor = [UIColor grayColor];
    self.greyCoverView.layer.opacity = 0.6f;
    [self.view addSubview:self.greyCoverView];
    
    self.testLabel = [[UILabel alloc] init];
    self.testLabel.numberOfLines = 0;
    self.testLabel.frame = CGRectMake(self.view.frame.origin.x + 5,
                                      self.view.frame.origin.y + 10,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
    [self.view addSubview:self.testLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    BACEUser *baceUser = (BACEUser *)self.pfObject;
    
    self.testLabel.text = [NSString stringWithFormat:@"User Info: %@", baceUser.userContactName];
}

@end
