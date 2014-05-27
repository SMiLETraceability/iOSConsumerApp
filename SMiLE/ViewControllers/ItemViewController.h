//
//  ItemViewControllerNew.h
//  SMiLE
//
// 
//  Created by Mujtaba Mehdi on 10/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TraceabilityViewController.h"
#import "ItemWebViewController.h"

//#import "SHKActionSheet.h"
//#import "SHKItem.h"

@interface ItemViewController : UIViewController <BALResponseHandler, UIActionSheetDelegate>{
    BOOL isCallBusiness;
}

@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *loadingSpinner;
@property(nonatomic,weak) IBOutlet UIImageView *itemImage;
@property(nonatomic,weak) IBOutlet UILabel *itemTitle;
@property(nonatomic,weak) IBOutlet UILabel *producerTitle;
@property(nonatomic,weak) IBOutlet UIImageView *countryFlag;
@property(nonatomic,weak) IBOutlet UILabel *itemDescription;
@property(nonatomic,weak) IBOutlet UITextView *itemTextViewDesc;


@property(nonatomic,strong) NSString *itemID;
@property(nonatomic,strong) NSString *productID;
@property(nonatomic,strong) NSString *businessID;

@property(nonatomic,strong) Item *item;
@property(nonatomic,strong) Product *product;
@property(nonatomic,strong) Business *business;

-(IBAction)openTraceability:(id)sender;
- (IBAction)shareBtnTapped:(id)sender;

@end
