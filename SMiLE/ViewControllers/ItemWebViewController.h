//
//  ItemWebViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 21/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemWebViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIWebView *webView;
@property (nonatomic,strong) NSString *itemID;

@end
