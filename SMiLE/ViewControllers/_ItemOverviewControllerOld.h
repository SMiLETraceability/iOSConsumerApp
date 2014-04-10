//
//  ItemOverviewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 18/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "_TraceabilityViewController.h"
#import "TraceabilityViewController.h"
#import "FeedbackViewController.h"
#import "Item.h"
#import "ItemCell.h"

@interface _ItemOverviewControllerOld : UIViewController <UITableViewDataSource,UITableViewDelegate,BALResponseHandler>{
    NSMutableArray *cellTitlesArray;
    BOOL isProductCall;
}

- (id)initWithItemID:(NSString*)item_id;

@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *loadingSpinner;
@property(nonatomic,weak) IBOutlet UITableView *tableView;
@property(nonatomic,strong) IBOutlet ItemCell *itemCell;
@property(nonatomic,weak) IBOutlet UIImageView *itemImage;
@property(nonatomic,weak) IBOutlet UILabel *itemTitle;

@property(nonatomic,strong) NSString *itemID;
@property(nonatomic,strong) NSString *productID;

@property(nonatomic,strong) Item *item;
@property(nonatomic,strong) Product *product;
@end
