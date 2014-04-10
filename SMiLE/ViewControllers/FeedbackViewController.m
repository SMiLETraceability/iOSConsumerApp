//
//  FeedbackViewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 05/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController
@synthesize commentBox;

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
    
    [self drawBorder];
    [self.navigationItem setTitle:@"Feedback"];

    //[self drawShadow];
    
    // Do any additional setup after loading the view.
}

-(void)drawBorder{
    
    self.commentBox.layer.cornerRadius = 10;
    self.commentBox.layer.masksToBounds = YES;

    CGFloat borderWidth = 1.0f;
    
    self.commentBox.frame = CGRectInset(self.commentBox.frame, -borderWidth, -borderWidth);
    self.commentBox.layer.borderColor = [UIColor blackColor].CGColor;
    self.commentBox.layer.borderWidth = borderWidth;
}
-(void)drawShadow{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:commentBox.bounds];
    commentBox.layer.masksToBounds = NO;
    commentBox.layer.shadowColor = [UIColor blackColor].CGColor;
    commentBox.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    commentBox.layer.shadowOpacity = 0.5f;
    commentBox.layer.shadowPath = shadowPath.CGPath;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
