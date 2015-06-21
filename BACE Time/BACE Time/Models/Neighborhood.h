//
//  Neighborhood.h
//  BACE Time
//
//  Created by Romy on 6/16/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Parse/Parse.h>

@interface Neighborhood : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *neighborhoodName;
@property (strong, nonatomic) NSString *City;
@property (strong, nonatomic) NSString *neighborhoodRegion;

@end
