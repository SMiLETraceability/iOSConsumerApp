//
//  ItemCell.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 27/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic,strong) Item *item;
@property(nonatomic,strong) Product *product;

- (void)setupWithDictionary:(NSDictionary *)dictionary;
@end
