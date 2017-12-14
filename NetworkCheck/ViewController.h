//
//  ViewController.h
//  NetworkCheck
//
//  Created by David Arnold on 10/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *isReachable;
@property (strong, nonatomic) IBOutlet UISwitch *isReachableViaWifi;
@property (strong, nonatomic) IBOutlet UISwitch *isReachableViaWWAN;
@property (strong, nonatomic) IBOutlet UISwitch *isConnectionOnDemand;
@property (strong, nonatomic) IBOutlet UISwitch *isConnectionRequired;

-(void) reachabilityChanged:(NSNotification*) notification;

-(IBAction)makeNetworkRequest:(id)sender;

@end

