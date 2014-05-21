//
//  GalleryCollectionCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 28/04/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "GalleryCollectionCell.h"

@implementation GalleryCollectionCell
@synthesize imageView;
@synthesize titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews{
    [self setBackgroundColor:[UIColor clearColor]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
