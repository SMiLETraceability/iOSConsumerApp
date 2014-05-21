//
//  CardCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "BusinessInfoCell.h"

@interface BusinessInfoCell (){
    NSString *dateString;
}
@end

@implementation BusinessInfoCell
@synthesize farmLocation;

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
-(void)setupBusinessCell:(Business*)business{
    
    self.mainView.layer.cornerRadius = 10;
    self.mainView.layer.masksToBounds = YES;
    
    [self.mainTitleLabel setText:business.title];
    [self.titleLabel1 setText:@"Telephone: "];
    [self.titleLabel1Value setText:business.telephone];
    [self.titleLabel2 setText:@"Website: "];
    if([business.title isEqualToString:@"Berry Scrumptious"])
        [self.titleLabel2Value setText:@"http://wwww.berryscrumptious.co.uk"];
    else
        [self.titleLabel2Value setText:@"http://www.cambusomay.com"];
    
    [self.descriptionLabel setText:business.businessDescription];
    
   // [self.mainImage setImage:[UIImage imageNamed:@"strawberry_farm"]];
    [self getImage:business];
    
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://smile.abdn.ac.uk/smile/ext/img/farm-location.png"]];
    [self.farmLocation setImage:[UIImage imageWithData:imageData]];
}


-(void)getImage:(Business*)business{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:business.image]];
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

