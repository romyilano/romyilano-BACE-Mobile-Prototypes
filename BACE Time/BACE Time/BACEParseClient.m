//
//  BaceClient.m
//  BACE Time
//
//  Created by Romy on 6/17/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "BACEParseClient.h"
#import "BACEUser.h"
#import "BACEUtility.h"
#import "Constants.h"

@implementation BACEParseClient

- (void)fetchObjectsWithClassNameInBackground:(NSString *)className
                           andCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    PFQuery *classQuery = [PFQuery queryWithClassName:className];
    [classQuery findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (completionBlock) {
            if (!error) {
                completionBlock(objects, YES, nil);
            } else {
                completionBlock(@[], NO, error);
            }
        }
    }];
}

- (void)fetchAllUsersInBackground:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    PFQuery *query = [BACEUser query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (completionBlock) {
            if (!error) {
                completionBlock(objects, YES, nil);
            } else {
                completionBlock(@[], NO, error);
            }
        }
    }];
}

// todo - pfquery should be constructed here not inside the manager class
- (void)fetchObjectsWithPFQueryInBackground:(PFQuery *)pfQuery
                         andCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    [pfQuery findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (completionBlock) {
            if (!error) {
                completionBlock(objects, YES, nil);
            } else {
                completionBlock(@[], NO, error);
            }
        }
    }];
}

@end
