//
//  MAGViewController.h
//  Mobile Music Template
//
//  Created by Jesse Allison on 10/17/12.
//  Copyright (c) 2012 MAG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdDispatcher.h"

@interface MAGViewController : UIViewController {
    PdDispatcher *dispatcher;
    void *patch;
    
    IBOutlet UIWebView *mWebView;
}

@property (nonatomic) BOOL *enabled;

@end
