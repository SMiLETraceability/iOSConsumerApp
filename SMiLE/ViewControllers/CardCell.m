//
//  CardCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "CardCell.h"

@interface CardCell (){
    NSString *dateString;
}
@end

@implementation CardCell

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

- (void)setupWithDictionary:(NSDictionary *)dictionary
{
    self.mainView.layer.cornerRadius = 10;
    self.mainView.layer.masksToBounds = YES;
    
    self.mainImage.image = [UIImage imageNamed:[dictionary valueForKey:@"image"]];
    
    dateString = [dictionary valueForKey:@"date"];
    if (dateString) {
        self.dateLabel.text = [dictionary valueForKey:@"web"];
    } else {
        self.dateLabel.hidden = YES;
    }
    
}

//business info cell
-(void)setupBusinessCell:(Activity*)activity{
    
    self.mainView.layer.cornerRadius = 10;
    self.mainView.layer.masksToBounds = YES;
    
    [self.mainTitleLabel setText:@"Berry Scrumptious"];
    [self.titleLabel1 setText:@"Telephone: "];
    [self.titleLabel1Value setText:@"1234567890"];
    [self.titleLabel2 setText:@"Website: "];
    [self.titleLabel2Value setText:@"http://wwww.berryscrumptious.co.uk"];
    [self.descriptionLabel setText:@"Berry Scrumptious is the brain child of husband and wife team Claire and Ross Rennie. We're a small, innovative company based on Ross’s family farm in Aberdeenshire.\nRoss is charged with growing premium quality strawberries & raspberries especially for Berry Scrumptious. Claire is the creative side of the partnership and together we strive to provide the highest quality of product and service possible."];
    
    [self.mainImage setImage:[UIImage imageNamed:@"strawberry_farm"]];
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

