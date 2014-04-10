//
//  GalleryViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 10/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BALResponseHandler>

@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *loadingSpinner;
@property(nonatomic,weak) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *productsArray;
@end
