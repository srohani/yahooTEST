//
//  ViewController.m
//  YahooAPI-Test
//
//  Created by Samer Rohani on 2015-11-16.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createYahooSession];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//  http(s)://api.sportradar.us/nhl-(t)1/en/games/2015/reg/schedule.json?api_key=[your_api_key]



- (void)createYahooSession
{
    // Create session with consumer key, secret, application ID and callback URL
    self.session = [YahooSession sessionWithConsumerKey:@"dj0yJmk9UE5jR3FUellqQWo5JmQ9WVdrOVNFc3lkMUV4TkdzbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD04MQ--"
                                      andConsumerSecret:@"612355cac5558b0b865e26dd559225f4dbb6ec6e"
                                       andApplicationId:@"HK2wQ14k"
                                         andCallbackUrl:@"http://test1.com/callback"
                                            andDelegate:self];
    // Try to resume a user session if one exists
    BOOL hasSession = [self.session resumeSession];
    
    // No session detected, send user to sign-in and authorization page
    if(!hasSession) {
        [self.session sendUserToAuthorization];
        // Session detected, user is already signed-in begin requests
    } else {
        NSLog(@"Session detected!");
        // Send authenticated requests to Yahoo APIs here...
        
        
        
    }
}

- (void)didReceiveAuthorization
{
    [self createYahooSession];
}

- (void)sendRequests
{
    // Initialize a user profile request
    YOSUserRequest *userRequest = [YOSUserRequest requestWithSession:self.session];
    
    // Fetch user profile
    [userRequest fetchProfileWithDelegate:self];
}

- (void)requestDidFinishLoading:(YOSResponseData *)data
{
    // Get the JSON response, will exist ONLY if requested response is JSON
    // If JSON does not exist, use data.responseText for NSString response
    NSDictionary *json = data.responseJSONDict;
    
    // Profile fetched
    NSDictionary *userProfile = json[@"profile"];
    if (userProfile) {
        NSLog(@"User profile fetched");
        NSLog(@"%@",userProfile);
    }
}


@end
