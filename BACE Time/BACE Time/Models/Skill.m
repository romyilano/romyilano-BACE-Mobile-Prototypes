//
//  Skill.m
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "Skill.h"
#import "Constants.h"
#import <Parse/PFObject+Subclass.h>

@implementation Skill
@dynamic skillName;
@dynamic skillDescription;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return kPAPSkillClassKey;
}

@end
