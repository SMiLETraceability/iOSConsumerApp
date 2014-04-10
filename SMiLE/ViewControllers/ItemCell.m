//
//  ItemCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 27/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell
@synthesize titleLabel,itemImage,product,item;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupWithDictionary:(NSDictionary *)dictionary
{
    product = [dictionary objectForKey:@"product"];
    item = [dictionary objectForKey:@"item"];
    
    [titleLabel setText:product.title];
    [self setImageFromURL];
    
    //self.titleLabel.text = [dictionary valueForKey:@"location"];
}

-(void)setImageFromURL{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:product.imageURL]];
    itemImage.image = [UIImage imageWithData:imageData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
