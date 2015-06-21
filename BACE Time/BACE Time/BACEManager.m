//
//  BACEManager.m
//  ParseStarterProject
//
//  Created by Romy on 6/15/15.
//
//

#import "BACEManager.h"
#import "BACEUtility.h"
#import "BACEParseClient.h"

NSString *BACEManagerErrorDomain = @"BACEManagerErrorDomain";

@interface BACEManager()
@property (strong, nonatomic) BACEParseClient *baceClient;
@end

@implementation BACEManager

// singleton
+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (id)init {
    if (self = [super init]) {
        _baceClient = [[BACEParseClient alloc] init];
    }
    return self;
}

#pragma mark - Final methods

- (void)fetchAllUsers:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    [self.baceClient fetchAllUsersInBackground:^(NSArray *usersArray, BOOL success, NSError *error) {
        if (completionBlock) {
            completionBlock(usersArray, success, error);
        }
    }];
}

- (void)fetchAllJobs:(void(^)(NSArray *jobsArray, BOOL success, NSError *error))completionBlock {
    [self.baceClient fetchObjectsWithClassNameInBackground:kPAPBaceJobClassKey
                                        andCompletionBlock:^(NSArray *objectsArray, BOOL success, NSError *error) {
                                            if (completionBlock) {
                                                if (success) {
                                                    completionBlock(objectsArray, success, nil);
                                                } else {
                                                    completionBlock(@[], NO, error);
                                                }
                                            }
                                        }];
}

- (void)fetchJobs:(NSString *)jobTypeString
withCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    PFQuery *jobQuery = [PFQuery queryWithClassName:kPAPBaceJobClassKey];
    [jobQuery whereKey:kPAPBaceJobJobCategoryKey equalTo:jobTypeString];
    [jobQuery whereKey:kPAPBaceJobExpirationDateKey greaterThan:[NSDate date]];
    
    [self.baceClient fetchObjectsWithPFQueryInBackground:jobQuery
                                      andCompletionBlock:^(NSArray *objectsArray, BOOL success, NSError *error) {
                                          if (completionBlock) {
                                              if (!error && success) {
                                                  completionBlock(objectsArray, success, nil);
                                              } else {
                                                  completionBlock(@[], success, error);
                                              }
                                          }
                                      }];
}

// todo - pfquery should not be constructed here but in the client ?
- (void)fetchJobsInBackground:(PFUser *)user
          baceJobPersonOption:(BaceJobOptions)jobPersonOption
              currentJobsOnly:(BOOL)currentOnly
          withCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    
    PFQuery *jobsQuery = [PFQuery queryWithClassName:kPAPBaceJobClassKey];
    if (jobPersonOption == BaceJobOptionsOfferingPerson || jobPersonOption == BaceJobOptionsBoth) {
        [jobsQuery whereKey:kPAPBaceJobOfferingPersonKey equalTo:user];
    } else if (jobPersonOption == BaceJobOptionsRequestingPerson || jobPersonOption == BaceJobOptionsBoth) {
        [jobsQuery whereKey:kPAPBaceJobRequestingPersonKey equalTo:user];
    }
   
    if (currentOnly) {
        [jobsQuery whereKey:kPAPBaceJobExpirationDateKey greaterThan:[NSDate date]];
    }
    
    [self.baceClient fetchObjectsWithPFQueryInBackground:jobsQuery
                                      andCompletionBlock:^(NSArray *objectsArray, BOOL success, NSError *error) {
                                          if (completionBlock) {
                                              if (success) {
                                                  completionBlock(objectsArray, YES, nil);
                                              } else {
                                                  completionBlock(@[], NO, nil);
                                              }
                                          }
                                      }];
}

#pragma mark - Misc Methods

- (void)fetchPFObjectsWithClassName:(NSString *)className
                         andOptions:(NSDictionary *)dictOptions
                withCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    // todo - move this into client later
    PFQuery *query = [PFQuery queryWithClassName:className];
    [query findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        NSError *queryError;
        if (completionBlock) {
            if (!error) {
                completionBlock(objects, YES, nil);
            } else {
                queryError = error;
                completionBlock([NSArray array], NO, queryError);
            }
        }
    }];
}


#pragma mark - Redo

- (void)fetchJobsByLocation:(NSString *)locationName withCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    
    NSError *failError;
    
    // look up the neighborhood pfobj first - redo this later
    NSDictionary *neighborhoodKeyDict = [BACEUtility neighborhoodKeys];
    NSString *objectID = neighborhoodKeyDict[locationName];
    if (!objectID) {
        failError = [NSError errorWithDomain:BACEManagerErrorDomain
                                        code:ParseFetchErrorBadParameter
                                    userInfo:nil];
    }
    
    PFQuery *neighborhoodQuery = [PFQuery queryWithClassName:kPAPBaceNeighborhoodClassKey];
    PFObject *neighborhood = [neighborhoodQuery getObjectWithId:objectID];
    PFQuery *query = [PFQuery queryWithClassName:kPAPBaceJobClassKey];
    [query whereKey:kPAPBaceJobNeighborhoodKey equalTo:neighborhood];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (!error) {
            completionBlock(objects, YES, nil);
        } else {
            completionBlock([NSArray array], NO, error);
        }
    }];
}

@end
