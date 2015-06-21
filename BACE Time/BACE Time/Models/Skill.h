//
//  Skill.h
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>

@interface Skill : PFObject <PFSubclassing>
@property (strong, nonatomic) NSString *skillName;
@property (strong, nonatomic) NSString *skillDescription;
@end
