//
//  BaceJob.m
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "BaceJob.h"
#import "Constants.h"
#import <Parse/PFObject+Subclass.h>

@interface BaceJob()
+ (NSDateFormatter *)_dateFormatter;
@end

@implementation BaceJob

@dynamic jobTitle;
@dynamic jobDescription;
@dynamic expirationDate;
@dynamic createdAt;
@dynamic creditHours;
@dynamic jobCategory;

+ (void)load{
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return kPAPBaceJobClassKey;
}

+ (NSString *)stringTime:(NSDate *)startTime {
    return [[[self class] _dateFormatter] stringFromDate:startTime];
}

- (NSString *)expirationDateString {
    return [[self class] stringTime:self.expirationDate];
}

- (NSString *)createdAtString {
    return [[self class] stringTime:self.createdAt];
}

#pragma mark - Private methods

+ (NSDateFormatter *)_dateFormatter {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"LLL d"];
    }
    return formatter;
}

@end
