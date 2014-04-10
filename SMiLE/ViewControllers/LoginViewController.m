//
//  LoginViewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 07/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize emailTxtField,passTxtField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)login:(id)sender{

    [[BAL sharedInstance] setResponseHandler:self];
    [[BAL sharedInstance] loginUser:emailTxtField.text withPassword:passTxtField.text];
}

-(void)BALResponse:(NSMutableDictionary *)response withSuccess:(BOOL)isSuccess{
    [[BAL sharedInstance] setResponseHandler:nil];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
