//
//  MainViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 06/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//


#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)btnTapped:(id)sender;
-(IBAction)scanBtnTapped:(id)sender;
-(IBAction)galleryBtnTapped:(id)sender;

@end
