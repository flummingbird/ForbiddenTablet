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
    
    if([[request.URL absoluteString] hasPrefix:@"nexus"]) {
        
        NSString *oscCommand = [url relativePath];
        NSArray *urlComponents = [oscCommand componentsSeparatedByString:@":"];
        
        
        /* HERE YOU SHOULD DEFINE YOUR OSC NAMES */
        
        NSString *tilt = @"/tilt1";
        NSString *button = @"/button1";
        NSString *multislider =@"/multislider1";
        NSString *multislider2 =@"/multislider2";
        
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
        if([[urlComponents objectAtIndex:0] isEqualToString:multislider]){

            
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"multislider0"];
            
            NSString *valueString2 = [urlComponents objectAtIndex:2];
            [PdBase sendFloat:[valueString2 floatValue] toReceiver:@"multislider1"];
            
            NSString *valueString3 = [urlComponents objectAtIndex:3];
            [PdBase sendFloat:[valueString3 floatValue] toReceiver:@"multislider2"];
            
            NSString *valueString4 = [urlComponents objectAtIndex:4];
            [PdBase sendFloat:[valueString4 floatValue] toReceiver:@"multislider3"];
            
            NSString *valueString5 = [urlComponents objectAtIndex:5];
            [PdBase sendFloat:[valueString5 floatValue] toReceiver:@"multislider4"];
            
            NSString *valueString6 = [urlComponents objectAtIndex:6];
            [PdBase sendFloat:[valueString6 floatValue] toReceiver:@"multislider5"];
            
            NSString *valueString7 = [urlComponents objectAtIndex:7];
            [PdBase sendFloat:[valueString7 floatValue] toReceiver:@"multislider6"];
            
            NSString *valueString8 = [urlComponents objectAtIndex:8];
            [PdBase sendFloat:[valueString8 floatValue] toReceiver:@"multislider7"];
            
            NSString *valueString9 = [urlComponents objectAtIndex:9];
            [PdBase sendFloat:[valueString9 floatValue] toReceiver:@"multislider8"];
            
            NSString *valueString10 = [urlComponents objectAtIndex:10];
            [PdBase sendFloat:[valueString10 floatValue] toReceiver:@"multislider9"];
            
            NSString *valueString11 = [urlComponents objectAtIndex:11];
            [PdBase sendFloat:[valueString11 floatValue] toReceiver:@"multislider10"];
            
            NSString *valueString12 = [urlComponents objectAtIndex:12];
            [PdBase sendFloat:[valueString12 floatValue] toReceiver:@"multislider11"];
            
            NSString *valueString13 = [urlComponents objectAtIndex:13];
            [PdBase sendFloat:[valueString13 floatValue] toReceiver:@"multislider12"];
            
            NSString *valueString14 = [urlComponents objectAtIndex:14];
            [PdBase sendFloat:[valueString14 floatValue] toReceiver:@"multislider13"];
            
            NSString *valueString15 = [urlComponents objectAtIndex:15];
            [PdBase sendFloat:[valueString15 floatValue] toReceiver:@"multislider14"];
            
            NSString *valueString16 = [urlComponents objectAtIndex:16];
            [PdBase sendFloat:[valueString16 floatValue] toReceiver:@"multislider15"];
            
            NSString *valueString17 = [urlComponents objectAtIndex:17];
            [PdBase sendFloat:[valueString17 floatValue] toReceiver:@"multislider16"];
            
            NSString *valueString18 = [urlComponents objectAtIndex:18];
            [PdBase sendFloat:[valueString18 floatValue] toReceiver:@"multislider17"];
            
            NSString *valueString19 = [urlComponents objectAtIndex:19];
            [PdBase sendFloat:[valueString19 floatValue] toReceiver:@"multislider18"];
            
            NSString *valueString20 = [urlComponents objectAtIndex:20];
            [PdBase sendFloat:[valueString20 floatValue] toReceiver:@"multislider19"];
            
            NSString *valueString21 = [urlComponents objectAtIndex:21];
            [PdBase sendFloat:[valueString21 floatValue] toReceiver:@"multislider20"];
            
            NSString *valueString22 = [urlComponents objectAtIndex:22];
            [PdBase sendFloat:[valueString22 floatValue] toReceiver:@"multislider21"];
            
            NSString *valueString23 = [urlComponents objectAtIndex:23];
            [PdBase sendFloat:[valueString23 floatValue] toReceiver:@"multislider22"];
            
            NSString *valueString24 = [urlComponents objectAtIndex:24];
            [PdBase sendFloat:[valueString24 floatValue] toReceiver:@"multislider23"];
            
            NSString *valueString25 = [urlComponents objectAtIndex:25];
            [PdBase sendFloat:[valueString25 floatValue] toReceiver:@"multislider24"];
            
            NSString *valueString26 = [urlComponents objectAtIndex:26];
            [PdBase sendFloat:[valueString26 floatValue] toReceiver:@"multislider25"];
            
            NSString *valueString27 = [urlComponents objectAtIndex:27];
            [PdBase sendFloat:[valueString27 floatValue] toReceiver:@"multislider26"];
            
            NSString *valueString28 = [urlComponents objectAtIndex:28];
            [PdBase sendFloat:[valueString28 floatValue] toReceiver:@"multislider27"];
            
            NSString *valueString29 = [urlComponents objectAtIndex:29];
            [PdBase sendFloat:[valueString29 floatValue] toReceiver:@"multislider38"];
            
            NSString *valueString30 = [urlComponents objectAtIndex:30];
            [PdBase sendFloat:[valueString30 floatValue] toReceiver:@"multislider29"];
            
            NSString *valueString31 = [urlComponents objectAtIndex:31];
            [PdBase sendFloat:[valueString31 floatValue] toReceiver:@"multislider30"];
            
            NSString *valueString32 = [urlComponents objectAtIndex:32];
            [PdBase sendFloat:[valueString32 floatValue] toReceiver:@"multislider31"];
            
            NSString *valueString33 = [urlComponents objectAtIndex:33];
            [PdBase sendFloat:[valueString33 floatValue] toReceiver:@"multislider32"];
            
            NSString *valueString34 = [urlComponents objectAtIndex:34];
            [PdBase sendFloat:[valueString34 floatValue] toReceiver:@"multislider33"];
            
            NSString *valueString35 = [urlComponents objectAtIndex:35];
            [PdBase sendFloat:[valueString35 floatValue] toReceiver:@"multislider34"];
            
            NSString *valueString36 = [urlComponents objectAtIndex:36];
            [PdBase sendFloat:[valueString36 floatValue] toReceiver:@"multislider35"];
            
            NSString *valueString37 = [urlComponents objectAtIndex:37];
            [PdBase sendFloat:[valueString37 floatValue] toReceiver:@"multislider36"];
            
            NSString *valueString38 = [urlComponents objectAtIndex:38];
            [PdBase sendFloat:[valueString38 floatValue] toReceiver:@"multislider37"];
            
            NSString *valueString39 = [urlComponents objectAtIndex:39];
            [PdBase sendFloat:[valueString39 floatValue] toReceiver:@"multislider38"];
            
            NSString *valueString40 = [urlComponents objectAtIndex:40];
            [PdBase sendFloat:[valueString40 floatValue] toReceiver:@"multislider39"];
            
            NSString *valueString41 = [urlComponents objectAtIndex:41];
            [PdBase sendFloat:[valueString41 floatValue] toReceiver:@"multislider40"];
            
            NSString *valueString42 = [urlComponents objectAtIndex:42];
            [PdBase sendFloat:[valueString42 floatValue] toReceiver:@"multislider41"];
            
            NSString *valueString43 = [urlComponents objectAtIndex:43];
            [PdBase sendFloat:[valueString43 floatValue] toReceiver:@"multislider42"];
            
            NSString *valueString44 = [urlComponents objectAtIndex:44];
            [PdBase sendFloat:[valueString44 floatValue] toReceiver:@"multislider43"];
            
            NSString *valueString45 = [urlComponents objectAtIndex:45];
            [PdBase sendFloat:[valueString45 floatValue] toReceiver:@"multislider44"];
            
            NSString *valueString46 = [urlComponents objectAtIndex:46];
            [PdBase sendFloat:[valueString46 floatValue] toReceiver:@"multislider45"];
            
            NSString *valueString47 = [urlComponents objectAtIndex:47];
            [PdBase sendFloat:[valueString47 floatValue] toReceiver:@"multislider46"];
            
            NSString *valueString48 = [urlComponents objectAtIndex:48];
            [PdBase sendFloat:[valueString48 floatValue] toReceiver:@"multislider47"];
            
            NSString *valueString49 = [urlComponents objectAtIndex:49];
            [PdBase sendFloat:[valueString49 floatValue] toReceiver:@"multislider48"];
            
            NSString *valueString50 = [urlComponents objectAtIndex:50];
            [PdBase sendFloat:[valueString50 floatValue] toReceiver:@"multislider49"];
            
            NSString *valueString51 = [urlComponents objectAtIndex:51];
            [PdBase sendFloat:[valueString51 floatValue] toReceiver:@"multislider50"];
            
            NSString *valueString52 = [urlComponents objectAtIndex:52];
            [PdBase sendFloat:[valueString52 floatValue] toReceiver:@"multislider51"];
            
            NSString *valueString53 = [urlComponents objectAtIndex:53];
            [PdBase sendFloat:[valueString53 floatValue] toReceiver:@"multislider52"];
            
            NSString *valueString54 = [urlComponents objectAtIndex:54];
            [PdBase sendFloat:[valueString54 floatValue] toReceiver:@"multislider53"];
            
            NSString *valueString55 = [urlComponents objectAtIndex:55];
            [PdBase sendFloat:[valueString55 floatValue] toReceiver:@"multislider54"];
            
            NSString *valueString56 = [urlComponents objectAtIndex:56];
            [PdBase sendFloat:[valueString56 floatValue] toReceiver:@"multislider55"];
            
            NSString *valueString57 = [urlComponents objectAtIndex:57];
            [PdBase sendFloat:[valueString57 floatValue] toReceiver:@"multislider56"];
            
            NSString *valueString58 = [urlComponents objectAtIndex:58];
            [PdBase sendFloat:[valueString58 floatValue] toReceiver:@"multislider57"];
            
            NSString *valueString59 = [urlComponents objectAtIndex:59];
            [PdBase sendFloat:[valueString59 floatValue] toReceiver:@"multislider58"];
            
            NSString *valueString60 = [urlComponents objectAtIndex:60];
            [PdBase sendFloat:[valueString60 floatValue] toReceiver:@"multislider59"];
            
            NSString *valueString61 = [urlComponents objectAtIndex:61];
            [PdBase sendFloat:[valueString61 floatValue] toReceiver:@"multislider60"];
            
            NSString *valueString62 = [urlComponents objectAtIndex:62];
            [PdBase sendFloat:[valueString62 floatValue] toReceiver:@"multislider61"];
            
            NSString *valueString63 = [urlComponents objectAtIndex:63];
            [PdBase sendFloat:[valueString63 floatValue] toReceiver:@"multislider62"];
            
            NSString *valueString64 = [urlComponents objectAtIndex:64];
            [PdBase sendFloat:[valueString64 floatValue] toReceiver:@"multislider63"];
            
            NSString *valueString65 = [urlComponents objectAtIndex:65];
            [PdBase sendFloat:[valueString65 floatValue] toReceiver:@"multislider64"];
            
            NSString *valueString66 = [urlComponents objectAtIndex:66];
            [PdBase sendFloat:[valueString66 floatValue] toReceiver:@"multislider65"];
            
            NSString *valueString67 = [urlComponents objectAtIndex:67];
            [PdBase sendFloat:[valueString67 floatValue] toReceiver:@"multislider66"];
            
            NSString *valueString68 = [urlComponents objectAtIndex:68];
            [PdBase sendFloat:[valueString68 floatValue] toReceiver:@"multislider67"];
            
            NSString *valueString69 = [urlComponents objectAtIndex:69];
            [PdBase sendFloat:[valueString69 floatValue] toReceiver:@"multislider68"];
            
            NSString *valueString70 = [urlComponents objectAtIndex:70];
            [PdBase sendFloat:[valueString70 floatValue] toReceiver:@"multislider69"];
            
            NSString *valueString71 = [urlComponents objectAtIndex:71];
            [PdBase sendFloat:[valueString71 floatValue] toReceiver:@"multislider70"];
            
            NSString *valueString72 = [urlComponents objectAtIndex:72];
            [PdBase sendFloat:[valueString72 floatValue] toReceiver:@"multislider71"];
            
            NSString *valueString73 = [urlComponents objectAtIndex:73];
            [PdBase sendFloat:[valueString73 floatValue] toReceiver:@"multislider72"];
            
            NSString *valueString74 = [urlComponents objectAtIndex:74];
            [PdBase sendFloat:[valueString74 floatValue] toReceiver:@"multislider73"];
            
            NSString *valueString75 = [urlComponents objectAtIndex:75];
            [PdBase sendFloat:[valueString75 floatValue] toReceiver:@"multislider27"];
            
            NSString *valueString76 = [urlComponents objectAtIndex:76];
            [PdBase sendFloat:[valueString76 floatValue] toReceiver:@"multislider75"];
            
            NSString *valueString77 = [urlComponents objectAtIndex:77];
            [PdBase sendFloat:[valueString77 floatValue] toReceiver:@"multislider76"];
            
            NSString *valueString78 = [urlComponents objectAtIndex:78];
            [PdBase sendFloat:[valueString78 floatValue] toReceiver:@"multislider77"];
            
            NSString *valueString79 = [urlComponents objectAtIndex:79];
            [PdBase sendFloat:[valueString79 floatValue] toReceiver:@"multislider78"];
            
            NSString *valueString80 = [urlComponents objectAtIndex:80];
            [PdBase sendFloat:[valueString80 floatValue] toReceiver:@"multislider79"];
            
            NSString *valueString81 = [urlComponents objectAtIndex:81];
            [PdBase sendFloat:[valueString81 floatValue] toReceiver:@"multislider80"];
            
            NSString *valueString82 = [urlComponents objectAtIndex:82];
            [PdBase sendFloat:[valueString82 floatValue] toReceiver:@"multislider81"];
            
            NSString *valueString83 = [urlComponents objectAtIndex:83];
            [PdBase sendFloat:[valueString83 floatValue] toReceiver:@"multislider82"];
            
            NSString *valueString84 = [urlComponents objectAtIndex:34];
            [PdBase sendFloat:[valueString84 floatValue] toReceiver:@"multislider83"];
            
            NSString *valueString85 = [urlComponents objectAtIndex:85];
            [PdBase sendFloat:[valueString85 floatValue] toReceiver:@"multislider84"];
            
            NSString *valueString86 = [urlComponents objectAtIndex:86];
            [PdBase sendFloat:[valueString86 floatValue] toReceiver:@"multislider85"];
            
            NSString *valueString87 = [urlComponents objectAtIndex:87];
            [PdBase sendFloat:[valueString87 floatValue] toReceiver:@"multislider86"];
            
            NSString *valueString88 = [urlComponents objectAtIndex:88];
            [PdBase sendFloat:[valueString88 floatValue] toReceiver:@"multislider87"];
            
            NSString *valueString89 = [urlComponents objectAtIndex:89];
            [PdBase sendFloat:[valueString89 floatValue] toReceiver:@"multislider88"];
            
            NSString *valueString90 = [urlComponents objectAtIndex:90];
            [PdBase sendFloat:[valueString90 floatValue] toReceiver:@"multislider89"];
            
            NSString *valueString91 = [urlComponents objectAtIndex:91];
            [PdBase sendFloat:[valueString91 floatValue] toReceiver:@"multislider40"];
            
            NSString *valueString92 = [urlComponents objectAtIndex:92];
            [PdBase sendFloat:[valueString92 floatValue] toReceiver:@"multislider91"];
            
            NSString *valueString93 = [urlComponents objectAtIndex:93];
            [PdBase sendFloat:[valueString93 floatValue] toReceiver:@"multislider92"];
            
            NSString *valueString94 = [urlComponents objectAtIndex:94];
            [PdBase sendFloat:[valueString94 floatValue] toReceiver:@"multislider93"];
            
            NSString *valueString95 = [urlComponents objectAtIndex:95];
            [PdBase sendFloat:[valueString95 floatValue] toReceiver:@"multislider94"];
            
            NSString *valueString96 = [urlComponents objectAtIndex:96];
            [PdBase sendFloat:[valueString96 floatValue] toReceiver:@"multislider95"];
            
            NSString *valueString97 = [urlComponents objectAtIndex:97];
            [PdBase sendFloat:[valueString97 floatValue] toReceiver:@"multislider96"];
            
            NSString *valueString98 = [urlComponents objectAtIndex:98];
            [PdBase sendFloat:[valueString98 floatValue] toReceiver:@"multislider97"];
            
            NSString *valueString99 = [urlComponents objectAtIndex:99];
            [PdBase sendFloat:[valueString99 floatValue] toReceiver:@"multislider98"];
            
            NSString *valueString100 = [urlComponents objectAtIndex:100];
            [PdBase sendFloat:[valueString100 floatValue] toReceiver:@"multislider99"];
            
            NSString *valueString101 = [urlComponents objectAtIndex:101];
            [PdBase sendFloat:[valueString101 floatValue] toReceiver:@"multislider100"];
            
            NSString *valueString102 = [urlComponents objectAtIndex:102];
            [PdBase sendFloat:[valueString102 floatValue] toReceiver:@"multislider101"];
            
            NSString *valueString103 = [urlComponents objectAtIndex:103];
            [PdBase sendFloat:[valueString103 floatValue] toReceiver:@"multislider102"];
            
            NSString *valueString104 = [urlComponents objectAtIndex:104];
            [PdBase sendFloat:[valueString104 floatValue] toReceiver:@"multislider103"];
            
            NSString *valueString105 = [urlComponents objectAtIndex:105];
            [PdBase sendFloat:[valueString105 floatValue] toReceiver:@"multislider104"];
            
            NSString *valueString106 = [urlComponents objectAtIndex:106];
            [PdBase sendFloat:[valueString106 floatValue] toReceiver:@"multislider105"];
            
            NSString *valueString107 = [urlComponents objectAtIndex:107];
            [PdBase sendFloat:[valueString107 floatValue] toReceiver:@"multislider106"];
            
            NSString *valueString108 = [urlComponents objectAtIndex:108];
            [PdBase sendFloat:[valueString108 floatValue] toReceiver:@"multislider107"];
            
            NSString *valueString109 = [urlComponents objectAtIndex:109];
            [PdBase sendFloat:[valueString109 floatValue] toReceiver:@"multislider108"];
            
            NSString *valueString110 = [urlComponents objectAtIndex:110];
            [PdBase sendFloat:[valueString110 floatValue] toReceiver:@"multislider109"];
            
            NSString *valueString111 = [urlComponents objectAtIndex:111];
            [PdBase sendFloat:[valueString111 floatValue] toReceiver:@"multislider110"];
            
            NSString *valueString112 = [urlComponents objectAtIndex:112];
            [PdBase sendFloat:[valueString112 floatValue] toReceiver:@"multislider111"];
            
            NSString *valueString113 = [urlComponents objectAtIndex:113];
            [PdBase sendFloat:[valueString113 floatValue] toReceiver:@"multislider112"];
            
            NSString *valueString114 = [urlComponents objectAtIndex:114];
            [PdBase sendFloat:[valueString114 floatValue] toReceiver:@"multislider113"];
            
            NSString *valueString115 = [urlComponents objectAtIndex:115];
            [PdBase sendFloat:[valueString115 floatValue] toReceiver:@"multislider114"];
            
            NSString *valueString116 = [urlComponents objectAtIndex:116];
            [PdBase sendFloat:[valueString116 floatValue] toReceiver:@"multislider115"];
            
            NSString *valueString117 = [urlComponents objectAtIndex:117];
            [PdBase sendFloat:[valueString117 floatValue] toReceiver:@"multislider116"];
            
            NSString *valueString118 = [urlComponents objectAtIndex:118];
            [PdBase sendFloat:[valueString118 floatValue] toReceiver:@"multislider117"];
            
            NSString *valueString119 = [urlComponents objectAtIndex:119];
            [PdBase sendFloat:[valueString119 floatValue] toReceiver:@"multislider118"];
            
            NSString *valueString120 = [urlComponents objectAtIndex:120];
            [PdBase sendFloat:[valueString120 floatValue] toReceiver:@"multislider119"];
            
            NSString *valueString121 = [urlComponents objectAtIndex:121];
            [PdBase sendFloat:[valueString121 floatValue] toReceiver:@"multislider120"];
            
            NSString *valueString122 = [urlComponents objectAtIndex:122];
            [PdBase sendFloat:[valueString122 floatValue] toReceiver:@"multislider121"];
            
            NSString *valueString123 = [urlComponents objectAtIndex:123];
            [PdBase sendFloat:[valueString123 floatValue] toReceiver:@"multislider122"];
            
            NSString *valueString124 = [urlComponents objectAtIndex:124];
            [PdBase sendFloat:[valueString124 floatValue] toReceiver:@"multislider123"];
            
            NSString *valueString125 = [urlComponents objectAtIndex:125];
            [PdBase sendFloat:[valueString125 floatValue] toReceiver:@"multislider124"];
            
            NSString *valueString126 = [urlComponents objectAtIndex:126];
            [PdBase sendFloat:[valueString126 floatValue] toReceiver:@"multislider125"];
            
            NSString *valueString127 = [urlComponents objectAtIndex:127];
            [PdBase sendFloat:[valueString127 floatValue] toReceiver:@"multislider126"];
            
            NSString *valueString128 = [urlComponents objectAtIndex:128];
            [PdBase sendFloat:[valueString128 floatValue] toReceiver:@"multislider127"];
            
            NSString *valueString129 = [urlComponents objectAtIndex:129];
            [PdBase sendFloat:[valueString129 floatValue] toReceiver:@"multislider128"];
            
            NSString *valueString130 = [urlComponents objectAtIndex:130];
            [PdBase sendFloat:[valueString130 floatValue] toReceiver:@"multislider129"];
            
            NSString *valueString131 = [urlComponents objectAtIndex:131];
            [PdBase sendFloat:[valueString131 floatValue] toReceiver:@"multislider130"];
            
            NSString *valueString132 = [urlComponents objectAtIndex:132];
            [PdBase sendFloat:[valueString132 floatValue] toReceiver:@"multislider131"];
            
            NSString *valueString133 = [urlComponents objectAtIndex:133];
            [PdBase sendFloat:[valueString133 floatValue] toReceiver:@"multislider132"];
            
            NSString *valueString134 = [urlComponents objectAtIndex:134];
            [PdBase sendFloat:[valueString134 floatValue] toReceiver:@"multislider133"];
            
            NSString *valueString135 = [urlComponents objectAtIndex:135];
            [PdBase sendFloat:[valueString135 floatValue] toReceiver:@"multislider134"];
            
            NSString *valueString136 = [urlComponents objectAtIndex:136];
            [PdBase sendFloat:[valueString136 floatValue] toReceiver:@"multislider135"];
            
            NSString *valueString137 = [urlComponents objectAtIndex:137];
            [PdBase sendFloat:[valueString137 floatValue] toReceiver:@"multislider136"];
            
            NSString *valueString138 = [urlComponents objectAtIndex:138];
            [PdBase sendFloat:[valueString138 floatValue] toReceiver:@"multislider137"];
            
            NSString *valueString139 = [urlComponents objectAtIndex:139];
            [PdBase sendFloat:[valueString139 floatValue] toReceiver:@"multislider138"];
            
            NSString *valueString140 = [urlComponents objectAtIndex:140];
            [PdBase sendFloat:[valueString140 floatValue] toReceiver:@"multislider139"];
            
            NSString *valueString141 = [urlComponents objectAtIndex:141];
            [PdBase sendFloat:[valueString141 floatValue] toReceiver:@"multislider140"];
            
            NSString *valueString142 = [urlComponents objectAtIndex:142];
            [PdBase sendFloat:[valueString142 floatValue] toReceiver:@"multislider141"];
            
            NSString *valueString143 = [urlComponents objectAtIndex:143];
            [PdBase sendFloat:[valueString143 floatValue] toReceiver:@"multislider142"];
            
            NSString *valueString144 = [urlComponents objectAtIndex:144];
            [PdBase sendFloat:[valueString144 floatValue] toReceiver:@"multislider143"];
            
            NSString *valueString145 = [urlComponents objectAtIndex:145];
            [PdBase sendFloat:[valueString145 floatValue] toReceiver:@"multislider144"];
            
            NSString *valueString146 = [urlComponents objectAtIndex:146];
            [PdBase sendFloat:[valueString146 floatValue] toReceiver:@"multislider145"];
            
            NSString *valueString147 = [urlComponents objectAtIndex:147];
            [PdBase sendFloat:[valueString147 floatValue] toReceiver:@"multislider146"];
            
            NSString *valueString148 = [urlComponents objectAtIndex:148];
            [PdBase sendFloat:[valueString148 floatValue] toReceiver:@"multislider147"];
            
            NSString *valueString149 = [urlComponents objectAtIndex:149];
            [PdBase sendFloat:[valueString149 floatValue] toReceiver:@"multislider148"];
            
            NSString *valueString150 = [urlComponents objectAtIndex:150];
            [PdBase sendFloat:[valueString150 floatValue] toReceiver:@"multislider149"];
            
            NSString *valueString151 = [urlComponents objectAtIndex:151];
            [PdBase sendFloat:[valueString151 floatValue] toReceiver:@"multislider150"];
            
            NSString *valueString152 = [urlComponents objectAtIndex:152];
            [PdBase sendFloat:[valueString152 floatValue] toReceiver:@"multislider151"];
            
            NSString *valueString153 = [urlComponents objectAtIndex:153];
            [PdBase sendFloat:[valueString153 floatValue] toReceiver:@"multislider152"];
            
            NSString *valueString154 = [urlComponents objectAtIndex:154];
            [PdBase sendFloat:[valueString154 floatValue] toReceiver:@"multislider153"];
            
            NSString *valueString155 = [urlComponents objectAtIndex:155];
            [PdBase sendFloat:[valueString155 floatValue] toReceiver:@"multislider154"];
            
            NSString *valueString156 = [urlComponents objectAtIndex:156];
            [PdBase sendFloat:[valueString156 floatValue] toReceiver:@"multislider155"];
            
            NSString *valueString157 = [urlComponents objectAtIndex:157];
            [PdBase sendFloat:[valueString157 floatValue] toReceiver:@"multislider156"];
            
            NSString *valueString158 = [urlComponents objectAtIndex:158];
            [PdBase sendFloat:[valueString158 floatValue] toReceiver:@"multislider157"];
            
            NSString *valueString159 = [urlComponents objectAtIndex:159];
            [PdBase sendFloat:[valueString159 floatValue] toReceiver:@"multislider158"];
            
            NSString *valueString160 = [urlComponents objectAtIndex:160];
            [PdBase sendFloat:[valueString160 floatValue] toReceiver:@"multislider159"];
            
            NSString *valueString161 = [urlComponents objectAtIndex:161];
            [PdBase sendFloat:[valueString161 floatValue] toReceiver:@"multislider160"];
            
            NSString *valueString162 = [urlComponents objectAtIndex:162];
            [PdBase sendFloat:[valueString162 floatValue] toReceiver:@"multislider161"];
            
            NSString *valueString163 = [urlComponents objectAtIndex:163];
            [PdBase sendFloat:[valueString163 floatValue] toReceiver:@"multislider162"];
            
            NSString *valueString164 = [urlComponents objectAtIndex:164];
            [PdBase sendFloat:[valueString164 floatValue] toReceiver:@"multislider163"];
            
            NSString *valueString165 = [urlComponents objectAtIndex:165];
            [PdBase sendFloat:[valueString165 floatValue] toReceiver:@"multislider164"];
            
            NSString *valueString166 = [urlComponents objectAtIndex:166];
            [PdBase sendFloat:[valueString166 floatValue] toReceiver:@"multislider165"];
            
            NSString *valueString167 = [urlComponents objectAtIndex:167];
            [PdBase sendFloat:[valueString167 floatValue] toReceiver:@"multislider166"];
            
            NSString *valueString168 = [urlComponents objectAtIndex:168];
            [PdBase sendFloat:[valueString168 floatValue] toReceiver:@"multislider167"];
            
            NSString *valueString169 = [urlComponents objectAtIndex:169];
            [PdBase sendFloat:[valueString169 floatValue] toReceiver:@"multislider168"];
            
            NSString *valueString170 = [urlComponents objectAtIndex:170];
            [PdBase sendFloat:[valueString170 floatValue] toReceiver:@"multislider69"];
            
            NSString *valueString171 = [urlComponents objectAtIndex:171];
            [PdBase sendFloat:[valueString171 floatValue] toReceiver:@"multislider170"];
            
            NSString *valueString172 = [urlComponents objectAtIndex:172];
            [PdBase sendFloat:[valueString172 floatValue] toReceiver:@"multislider171"];
            
            NSString *valueString173 = [urlComponents objectAtIndex:173];
            [PdBase sendFloat:[valueString173 floatValue] toReceiver:@"multislider172"];
            
            NSString *valueString174 = [urlComponents objectAtIndex:174];
            [PdBase sendFloat:[valueString174 floatValue] toReceiver:@"multislider173"];
            
            NSString *valueString175 = [urlComponents objectAtIndex:175];
            [PdBase sendFloat:[valueString175 floatValue] toReceiver:@"multislider174"];
            
            NSString *valueString176 = [urlComponents objectAtIndex:176];
            [PdBase sendFloat:[valueString176 floatValue] toReceiver:@"multislider175"];
            
            NSString *valueString177 = [urlComponents objectAtIndex:177];
            [PdBase sendFloat:[valueString177 floatValue] toReceiver:@"multislider176"];
            
            NSString *valueString178 = [urlComponents objectAtIndex:178];
            [PdBase sendFloat:[valueString178 floatValue] toReceiver:@"multislider177"];
            
            NSString *valueString179 = [urlComponents objectAtIndex:179];
            [PdBase sendFloat:[valueString179 floatValue] toReceiver:@"multislider178"];
            
            NSString *valueString180 = [urlComponents objectAtIndex:180];
            [PdBase sendFloat:[valueString180 floatValue] toReceiver:@"multislider179"];
            
            NSString *valueString181 = [urlComponents objectAtIndex:181];
            [PdBase sendFloat:[valueString181 floatValue] toReceiver:@"multislider180"];
            
            NSString *valueString182 = [urlComponents objectAtIndex:182];
            [PdBase sendFloat:[valueString182 floatValue] toReceiver:@"multislider181"];
            
            NSString *valueString183 = [urlComponents objectAtIndex:183];
            [PdBase sendFloat:[valueString183 floatValue] toReceiver:@"multislider182"];
            
            NSString *valueString184 = [urlComponents objectAtIndex:134];
            [PdBase sendFloat:[valueString184 floatValue] toReceiver:@"multislider183"];
            
            NSString *valueString185 = [urlComponents objectAtIndex:185];
            [PdBase sendFloat:[valueString185 floatValue] toReceiver:@"multislider184"];
            
            NSString *valueString186 = [urlComponents objectAtIndex:186];
            [PdBase sendFloat:[valueString186 floatValue] toReceiver:@"multislider185"];
            
            NSString *valueString187 = [urlComponents objectAtIndex:187];
            [PdBase sendFloat:[valueString187 floatValue] toReceiver:@"multislider186"];
            
            NSString *valueString188 = [urlComponents objectAtIndex:188];
            [PdBase sendFloat:[valueString188 floatValue] toReceiver:@"multislider187"];
            
            NSString *valueString189 = [urlComponents objectAtIndex:189];
            [PdBase sendFloat:[valueString189 floatValue] toReceiver:@"multislider188"];
            
            NSString *valueString190 = [urlComponents objectAtIndex:190];
            [PdBase sendFloat:[valueString190 floatValue] toReceiver:@"multislider189"];
            
            NSString *valueString191 = [urlComponents objectAtIndex:191];
            [PdBase sendFloat:[valueString191 floatValue] toReceiver:@"multislider140"];
            
            NSString *valueString192 = [urlComponents objectAtIndex:192];
            [PdBase sendFloat:[valueString192 floatValue] toReceiver:@"multislider191"];
            
            NSString *valueString193 = [urlComponents objectAtIndex:193];
            [PdBase sendFloat:[valueString193 floatValue] toReceiver:@"multislider192"];
            
            NSString *valueString194 = [urlComponents objectAtIndex:194];
            [PdBase sendFloat:[valueString194 floatValue] toReceiver:@"multislider193"];
            
            NSString *valueString195 = [urlComponents objectAtIndex:195];
            [PdBase sendFloat:[valueString195 floatValue] toReceiver:@"multislider194"];
            
            NSString *valueString196 = [urlComponents objectAtIndex:196];
            [PdBase sendFloat:[valueString196 floatValue] toReceiver:@"multislider195"];
            
            NSString *valueString197 = [urlComponents objectAtIndex:197];
            [PdBase sendFloat:[valueString197 floatValue] toReceiver:@"multislider196"];
            
            NSString *valueString198 = [urlComponents objectAtIndex:198];
            [PdBase sendFloat:[valueString198 floatValue] toReceiver:@"multislider197"];
            
            NSString *valueString199 = [urlComponents objectAtIndex:199];
            [PdBase sendFloat:[valueString199 floatValue] toReceiver:@"multislider198"];
            
            NSString *valueString200 = [urlComponents objectAtIndex:200];
            [PdBase sendFloat:[valueString200 floatValue] toReceiver:@"multislider199"];
            
            NSString *valueString201 = [urlComponents objectAtIndex:201];
            [PdBase sendFloat:[valueString201 floatValue] toReceiver:@"multislider201"];
            
            NSString *valueString202 = [urlComponents objectAtIndex:202];
            [PdBase sendFloat:[valueString202 floatValue] toReceiver:@"multislider201"];
            
            NSString *valueString203 = [urlComponents objectAtIndex:203];
            [PdBase sendFloat:[valueString203 floatValue] toReceiver:@"multislider202"];
            
            NSString *valueString204 = [urlComponents objectAtIndex:204];
            [PdBase sendFloat:[valueString204 floatValue] toReceiver:@"multislider203"];
            
            NSString *valueString205 = [urlComponents objectAtIndex:205];
            [PdBase sendFloat:[valueString205 floatValue] toReceiver:@"multislider204"];
            
            NSString *valueString206 = [urlComponents objectAtIndex:206];
            [PdBase sendFloat:[valueString206 floatValue] toReceiver:@"multislider205"];
            
            NSString *valueString207 = [urlComponents objectAtIndex:207];
            [PdBase sendFloat:[valueString207 floatValue] toReceiver:@"multislider206"];
            
            NSString *valueString208 = [urlComponents objectAtIndex:208];
            [PdBase sendFloat:[valueString208 floatValue] toReceiver:@"multislider207"];
            
            NSString *valueString209 = [urlComponents objectAtIndex:209];
            [PdBase sendFloat:[valueString209 floatValue] toReceiver:@"multislider208"];
            
            NSString *valueString210 = [urlComponents objectAtIndex:210];
            [PdBase sendFloat:[valueString210 floatValue] toReceiver:@"multislider209"];
            
            NSString *valueString211 = [urlComponents objectAtIndex:211];
            [PdBase sendFloat:[valueString211 floatValue] toReceiver:@"multislider210"];
            
            NSString *valueString212 = [urlComponents objectAtIndex:212];
            [PdBase sendFloat:[valueString212 floatValue] toReceiver:@"multislider211"];
            
            NSString *valueString213 = [urlComponents objectAtIndex:213];
            [PdBase sendFloat:[valueString213 floatValue] toReceiver:@"multislider212"];
            
            NSString *valueString214 = [urlComponents objectAtIndex:214];
            [PdBase sendFloat:[valueString214 floatValue] toReceiver:@"multislider213"];
            
            NSString *valueString215 = [urlComponents objectAtIndex:215];
            [PdBase sendFloat:[valueString215 floatValue] toReceiver:@"multislider214"];
            
            NSString *valueString216 = [urlComponents objectAtIndex:216];
            [PdBase sendFloat:[valueString216 floatValue] toReceiver:@"multislider215"];
      
            NSString *valueString217 = [urlComponents objectAtIndex:217];
            [PdBase sendFloat:[valueString217 floatValue] toReceiver:@"multislider216"];
            
            NSString *valueString218 = [urlComponents objectAtIndex:218];
            [PdBase sendFloat:[valueString218 floatValue] toReceiver:@"multislider217"];
      
            NSString *valueString219 = [urlComponents objectAtIndex:219];
            [PdBase sendFloat:[valueString219 floatValue] toReceiver:@"multislider218"];
            
            NSString *valueString220 = [urlComponents objectAtIndex:220];
            [PdBase sendFloat:[valueString220 floatValue] toReceiver:@"multislider219"];
            
            NSString *valueString221 = [urlComponents objectAtIndex:221];
            [PdBase sendFloat:[valueString221 floatValue] toReceiver:@"multislider220"];
            
            NSString *valueString222 = [urlComponents objectAtIndex:222];
            [PdBase sendFloat:[valueString222 floatValue] toReceiver:@"multislider221"];
            
            NSString *valueString223 = [urlComponents objectAtIndex:223];
            [PdBase sendFloat:[valueString223 floatValue] toReceiver:@"multislider222"];
            
            NSString *valueString224 = [urlComponents objectAtIndex:224];
            [PdBase sendFloat:[valueString224 floatValue] toReceiver:@"multislider223"];
            
            NSString *valueString225 = [urlComponents objectAtIndex:225];
            [PdBase sendFloat:[valueString225 floatValue] toReceiver:@"multislider224"];
            
            NSString *valueString226 = [urlComponents objectAtIndex:226];
            [PdBase sendFloat:[valueString226 floatValue] toReceiver:@"multislider225"];
            
            NSString *valueString227 = [urlComponents objectAtIndex:227];
            [PdBase sendFloat:[valueString227 floatValue] toReceiver:@"multislider226"];
            
            NSString *valueString228 = [urlComponents objectAtIndex:228];
            [PdBase sendFloat:[valueString228 floatValue] toReceiver:@"multislider227"];
            
            NSString *valueString229 = [urlComponents objectAtIndex:229];
            [PdBase sendFloat:[valueString229 floatValue] toReceiver:@"multislider228"];
            
            NSString *valueString230 = [urlComponents objectAtIndex:230];
            [PdBase sendFloat:[valueString230 floatValue] toReceiver:@"multislider229"];
            
            NSString *valueString231 = [urlComponents objectAtIndex:231];
            [PdBase sendFloat:[valueString231 floatValue] toReceiver:@"multislider230"];
            
            NSString *valueString232 = [urlComponents objectAtIndex:232];
            [PdBase sendFloat:[valueString232 floatValue] toReceiver:@"multislider31"];
            
            NSString *valueString233 = [urlComponents objectAtIndex:233];
            [PdBase sendFloat:[valueString233 floatValue] toReceiver:@"multislider232"];
            
            NSString *valueString234 = [urlComponents objectAtIndex:234];
            [PdBase sendFloat:[valueString234 floatValue] toReceiver:@"multislider233"];
            
            NSString *valueString235 = [urlComponents objectAtIndex:235];
            [PdBase sendFloat:[valueString235 floatValue] toReceiver:@"multislider234"];
            
            NSString *valueString236 = [urlComponents objectAtIndex:236];
            [PdBase sendFloat:[valueString236 floatValue] toReceiver:@"multislider235"];
            
            NSString *valueString237 = [urlComponents objectAtIndex:237];
            [PdBase sendFloat:[valueString237 floatValue] toReceiver:@"multislider236"];
            
            NSString *valueString238 = [urlComponents objectAtIndex:238];
            [PdBase sendFloat:[valueString238 floatValue] toReceiver:@"multislider237"];
            
            NSString *valueString239 = [urlComponents objectAtIndex:239];
            [PdBase sendFloat:[valueString239 floatValue] toReceiver:@"multislider238"];
            
            NSString *valueString240 = [urlComponents objectAtIndex:240];
            [PdBase sendFloat:[valueString240 floatValue] toReceiver:@"multislider239"];
            
            NSString *valueString241 = [urlComponents objectAtIndex:241];
            [PdBase sendFloat:[valueString241 floatValue] toReceiver:@"multislider240"];
            
            NSString *valueString242 = [urlComponents objectAtIndex:242];
            [PdBase sendFloat:[valueString242 floatValue] toReceiver:@"multislider241"];
            
            NSString *valueString243 = [urlComponents objectAtIndex:243];
            [PdBase sendFloat:[valueString243 floatValue] toReceiver:@"multislider242"];
            
            NSString *valueString244 = [urlComponents objectAtIndex:244];
            [PdBase sendFloat:[valueString244 floatValue] toReceiver:@"multislider243"];
            
            NSString *valueString245 = [urlComponents objectAtIndex:245];
            [PdBase sendFloat:[valueString245 floatValue] toReceiver:@"multislider244"];
            
            NSString *valueString246 = [urlComponents objectAtIndex:246];
            [PdBase sendFloat:[valueString246 floatValue] toReceiver:@"multislider245"];
            
            NSString *valueString247 = [urlComponents objectAtIndex:247];
            [PdBase sendFloat:[valueString247 floatValue] toReceiver:@"multislider246"];
            
            NSString *valueString248 = [urlComponents objectAtIndex:248];
            [PdBase sendFloat:[valueString248 floatValue] toReceiver:@"multislider247"];
            
            NSString *valueString249 = [urlComponents objectAtIndex:249];
            [PdBase sendFloat:[valueString249 floatValue] toReceiver:@"multislider248"];
            
            NSString *valueString250 = [urlComponents objectAtIndex:250];
            [PdBase sendFloat:[valueString250 floatValue] toReceiver:@"multislider249"];
            
            NSString *valueString251 = [urlComponents objectAtIndex:251];
            [PdBase sendFloat:[valueString251 floatValue] toReceiver:@"multislider250"];
            
            NSString *valueString252 = [urlComponents objectAtIndex:252];
            [PdBase sendFloat:[valueString252 floatValue] toReceiver:@"multislider251"];
            
            NSString *valueString253 = [urlComponents objectAtIndex:253];
            [PdBase sendFloat:[valueString253 floatValue] toReceiver:@"multislider252"];
            
            NSString *valueString254 = [urlComponents objectAtIndex:254];
            [PdBase sendFloat:[valueString254 floatValue] toReceiver:@"multislider253"];
            
            NSString *valueString255 = [urlComponents objectAtIndex:255];
            [PdBase sendFloat:[valueString255 floatValue] toReceiver:@"multislider254"];
            
            NSString *valueString256 = [urlComponents objectAtIndex:256];
            [PdBase sendFloat:[valueString256 floatValue] toReceiver:@"multislider255"];
        }
        
        if([[urlComponents objectAtIndex:0] isEqualToString:multislider2]){
            
            
            NSString *valueString = [urlComponents objectAtIndex:1];
            [PdBase sendFloat:[valueString floatValue] toReceiver:@"multislider2-0"];
            
            NSString *valueString2 = [urlComponents objectAtIndex:2];
            [PdBase sendFloat:[valueString2 floatValue] toReceiver:@"multislider2-1"];
            
            NSString *valueString3 = [urlComponents objectAtIndex:3];
            [PdBase sendFloat:[valueString3 floatValue] toReceiver:@"multislider2-2"];
            
            NSString *valueString4 = [urlComponents objectAtIndex:4];
            [PdBase sendFloat:[valueString4 floatValue] toReceiver:@"multislider2-3"];
            
            NSString *valueString5 = [urlComponents objectAtIndex:5];
            [PdBase sendFloat:[valueString5 floatValue] toReceiver:@"multislider2-4"];
            
            NSString *valueString6 = [urlComponents objectAtIndex:6];
            [PdBase sendFloat:[valueString6 floatValue] toReceiver:@"multislider2-5"];
            
            NSString *valueString7 = [urlComponents objectAtIndex:7];
            [PdBase sendFloat:[valueString7 floatValue] toReceiver:@"multislider2-6"];
            
            NSString *valueString8 = [urlComponents objectAtIndex:8];
            [PdBase sendFloat:[valueString8 floatValue] toReceiver:@"multislider2-7"];
            
            NSString *valueString9 = [urlComponents objectAtIndex:9];
            [PdBase sendFloat:[valueString9 floatValue] toReceiver:@"multislider2-8"];
            
            NSString *valueString10 = [urlComponents objectAtIndex:10];
            [PdBase sendFloat:[valueString10 floatValue] toReceiver:@"multislider2-9"];
            
            NSString *valueString11 = [urlComponents objectAtIndex:11];
            [PdBase sendFloat:[valueString11 floatValue] toReceiver:@"multislider10"];
            
            NSString *valueString12 = [urlComponents objectAtIndex:12];
            [PdBase sendFloat:[valueString12 floatValue] toReceiver:@"multislider11"];
        }
      
        
        return NO;
    }
    
    return YES;
}

@end
