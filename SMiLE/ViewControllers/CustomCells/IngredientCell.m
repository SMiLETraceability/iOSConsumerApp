//
//  CardCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "IngredientCell.h"

@implementation IngredientCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews{
    [self setBackgroundColor:[UIColor clearColor]];
}

//ingredient cell
-(void)setupCell:(Activity*)activity{
    
    self.mainView.layer.cornerRadius = 10;
    self.mainView.layer.masksToBounds = YES;
    
    //self.mainImage.image = [UIImage imageNamed:[dictionary valueForKey:@"image"]];
    
    
    Ingredient *ingredient = [[[activity toIngredient]allObjects]objectAtIndex:0];
    
    [self.mainTitleLabel setText:ingredient.title];
    [self.titleLabel1 setText:@"Producer"];
    [self.titleLabel1Value setText:ingredient.producer];
    [self.titleLabel2 setText:@"Collected From Farm: "];
    // [self.titleLabel2Value setText:ingredient.timestamp];
    
    [self.titleLabel2Value setText:@"10th March 2014"];
    [self.descriptionLabel setText:ingredient.desc];
    
    @try {
        //set image
        [self performSelectorInBackground:@selector(getImage:) withObject:ingredient];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@",__func__,[exception description]);
    }
}

-(void)getImage:(Ingredient*)ingredient{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ingredient.imageURL]];
    [self.mainImage setImage:[UIImage imageWithData:imageData]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

/*- (IBAction)launchWeb:(id)sender
 {
 if (website) {
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:website]];
 }
 }*/


@end

