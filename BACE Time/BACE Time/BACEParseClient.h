//
//  BaceClient.h
//  BACE Time
//
//  Created by Romy on 6/17/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

// Client class - calls Parse. Later on this will be replaced
@interface BACEParseClient : NSObject

- (void)fetchObjectsWithClassNameInBackground:(NSString *)className
                           andCompletionBlock:(void(^)(NSArray *objectsArray, BOOL success, NSError *error))completionBlock;

- (void)fetchAllUsersInBackground:(void(^)(NSArray *usersArray, BOOL success, NSError *error))completionBlock;

// TODO - the logic for PFQuery should be contained here but not put into the manager class but I'm taking a shortcut for now
- (void)fetchObjectsWithPFQueryInBackground:(PFQuery *)pfQuery
                         andCompletionBlock:(void(^)(NSArray *objectsArray, BOOL success, NSError *error))completionBlock;

@end
