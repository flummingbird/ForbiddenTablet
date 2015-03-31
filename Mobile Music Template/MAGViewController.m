//
//  MAGViewController.m
//  Mobile Music Template
//
//  Created by Jesse Allison on 10/17/12.
//  Copyright (c) 2012 MAG. All rights reserved.
//

#import "MAGViewController.h"

@interface MAGViewController ()

@end

@implementation MAGViewController

- (void)viewDidLoad
{
    NSLog(@"Log2");
    [super viewDidLoad];
	
    // _________________ LOAD Pd Patch ____________________
    dispatcher = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher];
    patch = [PdBase openFile:@"2Oscill.pd" path:[[NSBundle mainBundle] resourcePath]];
    if (!patch) {
        NSLog(@"Failed to open patch!");
    }
    
    
    [mWebView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [mWebView setOpaque:NO];
    mWebView.scrollView.scrollEnabled = NO;
    mWebView.scrollView.bounces = NO;
    
    /* STEP 1: LINK TO YOUR HTML PAGE IN THE WEBAPP FOLDER */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"WebApp"];
    NSURL*url= [NSURL fileURLWithPath:path];
    [mWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 STEP 2:
 THIS SECTION IS THE JESSE SPECIAL
 IT CAPTURES ANY URL STARTING WITH 'NEXUS' AND PARSES IT
 Working on a way around the index 10 beyond bounds error.
 */

- (BOOL)webView:(UIWebView *)mWebView shouldStartLoadWithRequest:(NSURLRequest *)request          navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = [request URL];
    NSLog([url absoluteString]);
    
    if([[request.URL absoluteString] hasPrefix:@"nexus"]) {
        
        NSString *oscCommand = [url relativePath];
        NSArray *urlComponents = [oscCommand componentsSeparatedByString:@":"];
        
        
        /* HERE YOU SHOULD DEFINE YOUR OSC NAMES */
        
        NSString *mess1 = @"/push1";
        NSString *mess2 = @"/push2";
        NSString *mess3 = @"/push3";
        NSString *mess4 = @"/push4";
        NSString *mess5 = @"/push5";
        NSString *mess6 = @"/push6";
        NSString *mess7 = @"/push7";
        NSString *mess8 = @"/push8";
        
        NSString *mult1 = @"/mult1";
        NSString *mult2 = @"/mult2";
        NSString *mult3 = @"/mult3";
        NSString *mult4 = @"/mult4";
        NSString *mult5 = @"/mult5";
        NSString *mult6 = @"/mult6";
        
        NSString *dial1 =@"/dial1";
        NSString *dial2 =@"/dial2";
        
        /* HERE YOU TEST FOR AN OSC NAME AND SEND ITS CONTENTS TO R CONTROL1 - R CONTROL10 IN PD
         i.e. urlComponents objectAtIndex:0 will be your OSCNAME coming form your nexus webpage
         */
        
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess1]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver: @"mess1"];
            
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess2]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver: @"mess2"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess3]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mess3"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess4]) {
            //send bang to pd receiver          
            [PdBase sendBangToReceiver:@"mess4"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess5]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mess5"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess6]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mess6"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess7]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mess7"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:mess8]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mess8"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:dial1]) {
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"dial1"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:dial2]) {
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"dial2"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult1]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult1"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult2]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult2"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult3]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult3"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult4]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult4"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult5]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult5"];
        }
        if([[urlComponents objectAtIndex:0] isEqualToString:mult6]) {
            //send bang to pd receiver
            [PdBase sendBangToReceiver:@"mult6"];
        }
              return NO;
    }
    
    return YES;
}

@end
