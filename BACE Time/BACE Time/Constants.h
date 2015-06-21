//
//  Constants.h
//  ParseStarterProject
//fa
//  Created by Romy on 6/5/15.
//
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

extern NSString *const kParseApplicationId;
extern NSString *const kParseClientKey;

#pragma mark - PFObject Job Class
extern NSString *const kPAPBaceJobClassKey;
extern NSString *const kPAPBaceJobExpirationDateKey;
extern NSString *const kPAPBaceJobJobTitleKey;
extern NSString *const kPAPBaceJobJobDescriptionKey;
extern NSString *const kPAPBaceJobJobTypeKey;
extern NSString *const kPAPBaceJobCreatedAtKey;
extern NSString *const kPAPBaceJobCreditHoursKey;
extern NSString *const kPAPBaceJobOfferingPersonKey;
extern NSString *const kPAPBaceJobRequestingPersonKey;
extern NSString *const kPAPBaceJobJobCategoryKey;
extern NSString *const kPAPBaceJobNeighborhoodKey;

#pragma mark - PFObject User Class
extern NSString *const kPAPUserClassKey;
extern NSString *const kPAPUserNameKey;
extern NSString *const kPAPUserContactName;
extern NSString *const kPAPUserDescriptionKey;
extern NSString *const kPAPUserEmailKey;
extern NSString *const kPAPUserCurrentBalancekey;
extern NSString *const kPAPUserUserLocationKey;
extern NSString *const kPAPUserReceivedHoursKey;
extern NSString *const kPAPUserProfilePhotoKey;
extern NSString *const kPAPUserTwitterKey;
extern NSString *const kPAPUserFacbookeKey;

extern NSString *const kPAPUserGivenHoursKey;
extern NSString *const kPAPBaceJobsKey;
extern NSString *const kPAPBaceRegionsKey;

#pragma mark - PFObject Skill
extern NSString *const kPAPSkillClassKey;

#pragma mark - PFObject Neighborhood class
extern NSString *const kPAPBaceNeighborhoodClassKey;

#pragma mark - PFObject Event Class
extern NSString *const kPAPBaceEventClassKey;
extern NSString *const kPAPBaceEventNameKey;
extern NSString *const kPAPBaceEventDescriptionKey;
extern NSString *const kPAPBaceEventLocationKey;

@end

typedef NS_ENUM(NSUInteger, BaceMainMenuOption) {
    BaceMainMenuOptionJobMine,
    BaceMainMenuOptionJobOffer,
    BaceMainMenuOptionJobRequest,
    BaceMainMenuOptionPeople,
    BaceMainMenuOptionSkill,
    BaceMainMenuOptionEvents,
    BaceMainMenuOptionAbout
};

typedef NS_ENUM(NSInteger, BaceJobOptions) {
    BaceJobOptionsOfferingPerson,
    BaceJobOptionsRequestingPerson,
    BaceJobOptionsBoth
};

typedef NS_ENUM(NSInteger, ParseFetchError)  {
    ParseFetchErrorUserNotLoggedInError,
    ParseFetchErrorNoDataError,
    ParseFetchErrorNetworkCallFailedError,
    ParseFetchErrorBadParameter
};