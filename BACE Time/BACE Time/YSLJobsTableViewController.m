//
//  YSLJobsTableViewController.m
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "YSLJobsTableViewController.h"
#import "YSLJobDetailViewController.h"
#import "BACEManager.h"
#import "BaceJob.h"
#import "YSLJobCell.h"

#define kJobCellHeight      150.0

@interface YSLJobsTableViewController ()
@property (strong, nonatomic) NSArray *jobsArray;

- (void)loadJobs;

@end

@implementation YSLJobsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    UIImageView *tableBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cooking"]];
    tableBackgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.backgroundView = tableBackgroundImageView;
    [self.tableView registerNib:[UINib nibWithNibName:@"YSLJobCell" bundle:nil]
         forCellReuseIdentifier:@"JobCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loadJobs];
}

#pragma mark - Custom Methods

// Loads the jobs
- (void)loadJobs {
   [[BACEManager sharedManager] fetchAllJobs:^(NSArray *jobsArray, BOOL success, NSError *error) {
       if (success && jobsArray.count > 0) {
           self.jobsArray = jobsArray;
           [self.tableView reloadData];
       }
   }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.jobsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"JobCell";
    YSLJobCell *cell = (YSLJobCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
    // Configure the cell...
    BaceJob *job = self.jobsArray[indexPath.row];
    cell.jobLabel.text = job.jobTitle;
    cell.jobDescription.text = [NSString stringWithFormat:@"Credit Hours: %@    Exp: %@\n%@", job.creditHours, job.expirationDateString, job.jobDescription];
    cell.jobLabel.textColor = [UIColor whiteColor];
    cell.jobDescription.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return kJobCellHeight;
}

#pragma mark - UITableViewDelegate Method

- (void)tableView:(nonnull UITableView *)tableView
didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    BaceJob *selectJob = self.jobsArray[indexPath.row];
    YSLJobDetailViewController *jobDetailVC = [[YSLJobDetailViewController alloc] initWithNibName:@"YSLJobDetailViewController" bundle:nil];
    jobDetailVC.baceJobObj = selectJob;
    [self.navigationController pushViewController:jobDetailVC animated:YES];
}

@end
