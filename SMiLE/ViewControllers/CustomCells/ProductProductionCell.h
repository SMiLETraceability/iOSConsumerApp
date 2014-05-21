//
//  ProductProductionCell.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductProductionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak,nonatomic) IBOutlet UIWebView *videoView;

@property (weak,nonatomic) IBOutlet UITextView *productionDescription;

- (void)setupCell:(ProductProduction*)production;
@end
