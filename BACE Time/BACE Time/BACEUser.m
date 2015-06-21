//
//  BACEUser.m
//  BACE Time
//
//  Created by Romy on 6/18/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "BACEUser.h"
#import "Neighborhood.h"
#import <Parse/PFObject+Subclass.h>

@implementation BACEUser

@dynamic currentBalance;
@dynamic givenHours;
@dynamic receivedHours;
@dynamic phoneNumber;
@dynamic userContactName;
@dynamic userDescription;
@dynamic profilePhoto;
@dynamic facebookLink;
@dynamic twitter;
@dynamic Neighborhood;

// note: don't have to implement  a parseClassName since PFUser already implements the method

@end
