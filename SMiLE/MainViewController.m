//
//  MainViewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 06/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "MainViewController.h"
#import "HTTPManager.h"
#import "GalleryViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize loginBtn, logoutBtn;
- (void)viewDidLoad
{
    NSLog(@"ready");
    
    //[SMiLEUtility saveUserAPIKey:API_TOKEN];

    [super viewDidLoad];
    
    //[self setLoginLogoutBtn];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLoginLogoutBtn{
    
    if([SMiLEUtility getUserAPIKey]){
      //  [logoutBtn setHidden:TRUE];
//        [loginBtn setHidden:FALSE];
        [loginBtn setEnabled:FALSE];
    }
    else{
        //[loginBtn setHidden:TRUE];
       // [logoutBtn setHidden:FALSE];

    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
    
    if ([[segue identifier] isEqualToString:@"PushGalleryView"]) {
        
        // [[segue destinationViewController] setDelegate:self];
    }}

-(IBAction)btnTapped:(id)sender{
    NSLog(@"I'm a Button!");
}

-(IBAction)scanBtnTapped:(id)sender{
    
}
-(IBAction)galleryBtnTapped:(id)sender{
    NSLog(@"%s",__func__);
   // [self performSegueWithIdentifer:@"PushGalleryView" sender:self];
}

-(IBAction)logoutBtnTapped:(id)sender{
    NSLog(@"I'm a Button!");
}
@end
