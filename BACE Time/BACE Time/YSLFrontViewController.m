//
//  YSLFrontViewController.m
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Parse/Parse.h>
#import "YSLFrontViewController.h"
#import "BACEUtility.h"
#import "YSLMainMenuViewController.h"
#import "YSLAboutViewController.h"
#import "YSLPeopleTableViewController.h"
#import "YSLJobsTableViewController.h"
#import "YSLSettingsViewController.h"

@interface YSLFrontViewController ()
@property (strong, nonatomic) YSLContainerViewController *yslContainerVC;
@end

@implementation YSLFrontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Navigation bar - thank you!
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.font = [BACEUtility baceCellFont];
    titleView.textColor = [UIColor colorWithRed:0.333333 green:0.333333 blue:0.333333 alpha:1.0];;
    titleView.text = @"Menu";
    [titleView sizeToFit];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    // set up the view controllers
    YSLMainMenuViewController *mainMenuVC = [[YSLMainMenuViewController alloc] init];
    mainMenuVC.title = @"Main";
    
    YSLJobsTableViewController *jobsTableVC = [[YSLJobsTableViewController alloc] init];
    jobsTableVC.title = @"Jobs";
    
    YSLPeopleTableViewController *peopleTableVC = [[YSLPeopleTableViewController alloc] init];
    peopleTableVC.title = @"People";
    
    YSLAboutViewController *aboutVC = [[YSLAboutViewController alloc] init];
    aboutVC.title = @"About";
    
    YSLSettingsViewController *settingsVC = [[YSLSettingsViewController alloc] init];
    settingsVC.title = @"Settings";
    
    //container view
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationheight = self.navigationController.navigationBar.frame.size.height;
    
    self.yslContainerVC = [[YSLContainerViewController alloc] initWithControllers:@[mainMenuVC, jobsTableVC, peopleTableVC, aboutVC, settingsVC]
topBarHeight:statusHeight + navigationheight
                             parentViewController:self];
    
    // set delegates for the child view controllers so they can talk to the ysl container
    aboutVC.delegate = self.yslContainerVC;
    peopleTableVC.delegate = self.yslContainerVC;
    
    self.yslContainerVC.delegate = self;
    self.yslContainerVC.menuItemFont = [BACEUtility secondaryCellFont];
    
    [self.view addSubview:self.yslContainerVC.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser]) {
        self.frontBarBtn.title = @"Profile";
    } else {
        self.frontBarBtn.title = @"Login";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YSLContainerViewControllerDelegate

- (void)containerViewItemIndex:(NSInteger)index
             currentController:(UIViewController *)controller {
   // NSLog(@"current Index : %ld",(long)index);
   // NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

@end
