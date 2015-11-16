//
//  ViewController.h
//  YahooAPI-Test
//
//  Created by Samer Rohani on 2015-11-16.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "YahooSDK.h"

@interface ViewController : UIViewController <YahooSessionDelegate>

@property (strong, nonatomic) YahooSession *session;


@end

