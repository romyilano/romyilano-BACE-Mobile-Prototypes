//
//  Neighborhood.m
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "Neighborhood.h"
#import "Constants.h"
#import "BACEUtility.h"
#import <Parse/PFObject+Subclass.h>

@implementation Neighborhood
@dynamic City;
@dynamic neighborhoodName;
@dynamic neighborhoodRegion;

+ (void)load{
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return kPAPBaceNeighborhoodClassKey;
}

@end
