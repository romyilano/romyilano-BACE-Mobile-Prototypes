//
//  Constants.m
//  ParseStarterProject
//
//  Created by Romy on 6/5/15.
//
//

#import "Constants.h"
#import "SecretKeys.h"

@implementation Constants

NSString *const kParseApplicationId = @"sB5gSDG6A0tNsXfxizENVuRo4dn7Z05cuBAMsSif";
NSString *const kParseClientKey = @"0f76CNCgxrR6kvP0LYWna5le7AwY0xY0ZZmcMiAW";

#pragma mark - PFObject BaceJob Class

NSString *const kPAPBaceJobClassKey = @"BaceJob";
NSString *const kPAPBaceJobExpirationDateKey = @"expirationDate";
NSString *const kPAPBaceJobJobTitleKey = @"jobTitle";
NSString *const kPAPBaceJobJobDescriptionKey = @"jobDescription";
NSString *const kPAPBaceJobJobTypeKey = @"jobType";
NSString *const kPAPBaceJobCreatedAtKey = @"createdAt";
NSString *const kPAPBaceJobCreditHoursKey = @"creditHours";
NSString *const kPAPBaceJobOfferingPersonKey = @"offeringPerson";
NSString *const kPAPBaceJobRequestingPersonKey = @"requestingPerson";
NSString *const kPAPBaceJobJobCategoryKey = @"jobCategory";
NSString *const kPAPBaceJobNeighborhoodKey = @"Neighborhood";

#pragma mark - PFObject User Class
NSString *const kPAPUserClassKey = @"User";
NSString *const kPAPUserNameKey = @"username";
NSString *const kPAPUserContactName = @"userContactName";
NSString *const kPAPUserDescriptionKey = @"userDescription";
NSString *const kPAPUserEmailKey = @"email";
NSString *const kPAPUserCurrentBalancekey = @"currentBalance";
NSString *const kPAPUserUserLocationKey = @"userLocation";
NSString *const kPAPUserReceivedHoursKey = @"receivedHours";
NSString *const kPAPUserGivenHoursKey = @"givenHours";
NSString *const kPAPBaceJobsKey = @"baceJobs";
NSString *const kPAPBaceRegionsKey = @"baceRegions";

NSString *const kPAPUserProfilePhotoKey = @"profilePhoto";
NSString *const kPAPUserTwitterKey = @"twitter";
NSString *const kPAPUserFacbookeKey = @"facebookLink";

#pragma mark - PFObject Skill
NSString *const kPAPSkillClassKey = @"Skill";

#pragma mark - PFObject Neighborhood class
NSString *const kPAPBaceNeighborhoodClassKey = @"Neighborhood";

#pragma mark - PFObject Event Class
NSString *const kPAPBaceEventClassKey = @"Event";
NSString *const kPAPBaceEventNameKey = @"eventName";
NSString *const kPAPBaceEventDescriptionKey = @"eventDescription";
NSString *const kPAPBaceEventLocationKey = @"eventLocation";

@end
