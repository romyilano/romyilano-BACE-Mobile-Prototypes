//
//  BaceJob.h
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Parse/Parse.h>
#import "Neighborhood.h"

@interface BaceJob : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *jobTitle;
@property (strong, nonatomic) NSString *jobDescription;
@property (strong, nonatomic) NSDate *expirationDate;
@property (strong, nonatomic) NSNumber *creditHours;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSString *jobCategory;

+ (NSString *)parseClassName;

+ (NSString *)stringTime:(NSDate *)startTime;
- (NSString *)expirationDateString;
- (NSString *)createdAtString;
@end
