//
//  YSLMainMenuViewController.h
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "YSLChildViewController.h"

@interface YSLMainMenuViewController :YSLChildViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UIImageView *backgroundView;
@property (strong, nonatomic) UITableView *mainMenuTableView;

@end
