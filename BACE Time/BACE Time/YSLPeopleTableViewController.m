//
//  PeopleTableViewController.m
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

// put this into contsntats
#define kPeopleCellHeight    96.0

#import "YSLPeopleTableViewController.h"
#import "YSLPeopleTableViewCell.h"
#import "YSLDetailViewController.h"
#import "BACEManager.h"
#import "BACEUser.h"

@interface YSLPeopleTableViewController ()
@property (strong, nonatomic) NSArray *peopleArray;
@end

@implementation YSLPeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"YSLPeopleTableViewCell" bundle:nil] forCellReuseIdentifier:@"PeopleCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // do any loading here, not in the viewdidload
    [self loadPeople];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

- (void)loadPeople {
    [[BACEManager sharedManager] fetchAllUsers:^(NSArray *peopleArray, BOOL success, NSError *error) {
        self.peopleArray = peopleArray;
        
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.peopleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSLPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PeopleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    BACEUser *user = self.peopleArray[indexPath.row];
    cell.nameLabel.text = user.username;
    cell.personDescriptionLabel.text = user.userDescription;
    
    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return kPeopleCellHeight;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BACEUser *user = self.peopleArray[indexPath.row];
    YSLDetailViewController *detailVC = [[YSLDetailViewController alloc] init];
    detailVC.pfObject = user;
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
