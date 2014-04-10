//
//  LoginViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 07/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <BALResponseHandler>

@property(nonatomic,weak) IBOutlet UITextField *emailTxtField;
@property(nonatomic,weak) IBOutlet UITextField *passTxtField;

-(IBAction)login:(id)sender;
@end
