//
//  YSLJobDetailViewController.m
//  BACE Time
//
//  Created by Romy on 6/19/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "YSLJobDetailViewController.h"
#import "BACEUtility.h"
#import "BaceJob.h"

@interface YSLJobDetailViewController ()

@end

@implementation YSLJobDetailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
    self.backgroundImageView.image = [UIImage imageNamed:@"kombucha-dark"];
    self.backgroundImageView.frame = self.view.frame;
    [self.view addSubview:self.backgroundImageView];
    
    self.jobHeaderOne.textColor = [UIColor whiteColor];
    self.jobHeaderOne.font = [BACEUtility baceCellFont];
    self.jobDescriptionLabel.font = [BACEUtility secondaryCellFont];
    self.jobDescriptionLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.jobHeaderOne];
    [self.view addSubview:self.jobDescriptionLabel];

    NSLog(@"subviews: %@", self.view.subviews);
     */
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = self.baceJobObj.jobTitle;
    self.jobHeaderOne.text = [NSString stringWithFormat:@"Credit Hours: %@      Exp: %@", self.baceJobObj.creditHours, self.baceJobObj.expirationDateString];
    self.jobDescriptionLabel.text = self.baceJobObj.jobDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressed:(UIButton *)sender {
    
}

@end
