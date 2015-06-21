//
//  YSLFrontViewController.h
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSLContainerViewController.h"

@interface YSLFrontViewController : UIViewController <YSLContainerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *frontBarBtn;
@end
