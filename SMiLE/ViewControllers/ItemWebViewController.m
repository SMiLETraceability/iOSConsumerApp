//
//  ItemWebViewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 21/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "ItemWebViewController.h"

@interface ItemWebViewController ()

@end

@implementation ItemWebViewController
@synthesize webView;
@synthesize itemID;
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
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ITEM_WEB_URL,itemID]]]];
    // Do any additional setup after loading the view.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('top-navbar').remove()"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
