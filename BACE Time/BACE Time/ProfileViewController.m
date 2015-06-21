//
//  ProfileViewController.m
//  BACE Time
//
//  Created by Romy on 6/17/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "ProfileViewController.h"
#import "Constants.h"
#import "BACEUser.h"

@interface ProfileViewController ()
@property (strong, nonatomic) PFFile *currentImagePFFile;
@property (strong, nonatomic) UIImage *currentUserProfilePhoto;
@property (strong, nonatomic) BACEUser *baceUser;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profilePhoto.image = [UIImage imageNamed:@"sandglass"];
    self.profilePhoto.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view.
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        [self presentViewController:logInViewController animated:YES completion:NULL];
    } else {
        self.userNameLabel.text = [[PFUser currentUser] objectForKey:kPAPUserContactName];
        self.userInfoLabel.text = [[PFUser currentUser] objectForKey:kPAPUserDescriptionKey];
        
        // set the image?
        // todo - this is inefficient since it appears every time view did appear happens
        //
        // self.baceUser = (BACEUser *)[PFUser currentUser];
     
        [[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject * __nullable object, NSError * __nullable error) {
            if (!error) {
                self.baceUser = (BACEUser *)object;
                NSLog(@"bace user: %@", self.baceUser);
                // self.currentImagePFFile = self.baceUser.profilePhoto;
                NSLog(@"current image pf file = %@", self.currentUserProfilePhoto);
                PFFile *profilePhoto2 = self.baceUser.profilePhoto;
                //NSLog(@"profile photo pointer is: %@", profilePhoto);
                self.profilePhoto.file = profilePhoto2;
                [self.profilePhoto loadInBackground];
                
              /*
                [profilePhoto getDataInBackgroundWithBlock:^(NSData * __nullable data, NSError * __nullable error) {
                    NSLog(@"pfoile photo data: %@", data);
                    NSLog(@"error message: %@", error);
                    if (!error) {
                        self.currentUserProfilePhoto = [UIImage imageWithData:data];
                        self.profilePhoto.image = self.currentUserProfilePhoto;
                    }
                }];
               */
                
                /*
                // this isn't working
                [profilePhoto getDataInBackgroundWithBlock:^(NSData * __nullable data, NSError * __nullable error) {
                    NSLog(@"is there data from the photo? %@", data);
                    if (!error) {
                        self.currentUserProfilePhoto = [UIImage imageWithData:data];
                        self.profilePhoto.image = self.currentUserProfilePhoto;
                    }
                }];
                 */
             
            }
        }];
        
        /*
        // self.currentImagePFFile = [[PFUser currentUser] objectForKey:kPAPUserProfilePhotoKey];
        NSLog(@"current image pffile: %@", self.currentImagePFFile);
        NSString *requestURL = self.currentImagePFFile.url;
        
        
        [self.currentImagePFFile getDataInBackgroundWithBlock:^(NSData * __nullable data, NSError * __nullable error) {
            // check if this is the main thread
            NSLog(@"current thread is: %@", [NSThread currentThread]);
            if (!error) {
                self.currentUserProfilePhoto = [UIImage imageWithData:data];
                self.profilePhoto.image = self.currentUserProfilePhoto;
            }
        }];
         */
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController
shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length && password.length) {
        return YES; // Begin login process
    }
    
    [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Missing Information", nil)
                                        message:NSLocalizedString(@"Make sure you fill out all the information!", nil)
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    [UIAlertController alertControllerWithTitle:@"Failed to Login"
                                        message:@"Please Try Again"
                                 preferredStyle:UIAlertControllerStyleAlert];
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"User dismissed the logInViewController");
}

#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || !field.length) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Missing Information", nil)
                                            message:NSLocalizedString(@"Make sure you fill out all the information!", nil)
                                     preferredStyle:UIAlertControllerStyleAlert];
    }
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}

#pragma mark - Action Methods

- (void)logoutBtnPressed:(UIButton *)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
