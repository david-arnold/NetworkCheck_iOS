//
//  AppDelegate.h
//  NetworkCheck
//
//  Created by David Arnold on 10/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Reachability *reach;

@end

