//
//  BACEUser.h
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Parse/Parse.h>

@class Neighborhood;
@interface BACEUser : PFUser <PFSubclassing>
@property (strong, nonatomic) NSNumber *currentBalance;
@property (strong, nonatomic) NSNumber *givenHours;
@property (strong, nonatomic) NSNumber *receivedHours;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *userContactName;
@property (strong, nonatomic) NSString *userDescription;
@property (strong, nonatomic) PFFile *profilePhoto;
@property (strong, nonatomic) NSString *facebookLink;
@property (strong, nonatomic) NSString *twitter;
@property (strong, nonatomic) Neighborhood *Neighborhood;
- (UIImage *)profilePhoto:(UIImage *)image;

@end
