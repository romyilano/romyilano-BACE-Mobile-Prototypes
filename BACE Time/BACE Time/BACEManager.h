//
//  BACEManager.h
//  ParseStarterProject
//
//  Created by Romy on 6/15/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Constants.h"

extern NSString *BACEManagerErrorDomain;

@interface BACEManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - Using Client

- (void)fetchAllUsers:(void(^)(NSArray *peopleArray, BOOL success, NSError *error))completionBlock;

- (void)fetchAllJobs:(void(^)(NSArray *jobsArray, BOOL success, NSError *error))completionBlock;

- (void)fetchJobs:(NSString *)jobTypeString
withCompletionBlock:(void(^)(NSArray *jobsArray, BOOL success, NSError *error))completionBlock;

- (void)fetchJobsInBackground:(PFUser *)user
                    baceJobPersonOption:(BaceJobOptions)jobPersonOption
              currentJobsOnly:(BOOL)currentOnly
          withCompletionBlock:(void(^)(NSArray *jobsArray, BOOL success, NSError *error))completionBlock;

#pragma mark - Redo

- (void)fetchJobsByLocation:(NSString *)locationName withCompletionBlock:(void(^)(NSArray *jobsArray, BOOL success, NSError *error))completionBlock;


@end
