//
//  ViewController.m
//  NetworkCheck
//
//  Created by David Arnold on 10/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize isReachable;
@synthesize isReachableViaWifi;
@synthesize isReachableViaWWAN;
@synthesize isConnectionOnDemand;
@synthesize isConnectionRequired;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Observe for Reachability Changes
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
}

-(void)reachabilityChanged:(NSNotification *)notification {
    NSLog(@"Reachability changed");
    
    if( [notification.object isKindOfClass:[Reachability class]]) {
        //class type verified
        Reachability *reach = (Reachability*) notification.object;
        NSLog(@"isReachable: %@", (reach.isReachable ? @"YES" : @"NO"));
        NSLog(@"isReachableViaWiFi: %@", (reach.isReachableViaWiFi ? @"YES" : @"NO"));
        NSLog(@"isReachableViaWWAN: %@", (reach.isReachableViaWWAN ? @"YES" : @"NO"));
        NSLog(@"isConnectionOnDemand: %@", (reach.isConnectionOnDemand ? @"YES" : @"NO"));
        NSLog(@"isConnectionRequired: %@", (reach.isConnectionRequired ? @"YES" : @"NO"));
        
        [self.isReachable setOn:reach.isReachable];
        [self.isReachableViaWifi setOn:reach.isReachableViaWiFi];
        [self.isReachableViaWWAN setOn:reach.isReachableViaWWAN];
        [self.isConnectionOnDemand setOn:reach.isConnectionOnDemand];
        [self.isConnectionRequired setOn:reach.isConnectionRequired];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(IBAction)makeNetworkRequest:(id)sender {
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operationQueue];
    
    //perhaps generate a guid and append to the URL to prevent caching ?
    
    NSUUID *uuid = [[NSUUID alloc]init];
    
    NSString *urlString = [NSString stringWithFormat:@"http://attts-sql2008.attlab.sw.rim.net/iisstart.htm?randomGuid=%@",[uuid UUIDString]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSLog(@"Asynchronous NSURLSessionDataTask completionHandler");
                                  }];
    
    [task resume];
}


@end
