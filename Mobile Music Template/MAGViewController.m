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
    patch = [PdBase openFile:@"mag_template.pd" path:[[NSBundle mainBundle] resourcePath]];
    if (!patch) {
        NSLog(@"Failed to open patch!");
    }
    
    
    [mWebView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [mWebView setOpaque:NO];
    mWebView.scrollView.scrollEnabled = NO;
    mWebView.scrollView.bounces = NO;
    
    /* STEP 1: LINK TO YOUR HTML PAGE IN THE WEBAPP FOLDER */
    
    NSString*path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"WebApp"];
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
 */

- (BOOL)webView:(UIWebView *)mWebView shouldStartLoadWithRequest:(NSURLRequest *)request          navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = [request URL];
    
    if([[request.URL absoluteString] hasPrefix:@"nexus"]) {
        // do stuff
        
        NSString *oscCommand = [url relativePath];
        
        NSArray *urlComponents = [oscCommand componentsSeparatedByString:@":"];
        
        /* HERE YOU SHOULD DEFINE YOUR OSC NAMES */
        
        NSString *tilt = @"/tilt1";
        NSString *button = @"/button1";


        /* HERE YOU TEST FOR AN OSC NAME AND SEND ITS CONTENTS TO R CONTROL1 - R CONTROL10 IN PD
            i.e. urlComponents objectAtIndex:0 will be your OSCNAME coming form your nexus webpage
         */
        
        if([[urlComponents objectAtIndex:0] isEqualToString:tilt]) {
        
            //send x to PD
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"tiltx"];
       //     NSLog(@"Tilt:%@",[urlComponents objectAtIndex:0]);
            
            //send y to PD
            NSString *valueString2 = [urlComponents objectAtIndex:2];
            [PdBase sendFloat:[valueString2 floatValue] toReceiver:@"tilty"];
            //        NSLog(@"itsends");

        }
        
      
        
        if([[urlComponents objectAtIndex:0] isEqualToString:button]) {
            
            //send button to pd
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"button1"];
            
            
        }
        
        return NO;
    }
    
    return YES;
}

@end
