//
//  CardCell.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "RecipeCell.h"

@interface RecipeCell (){
    NSString *dateString;
}
@end

@implementation RecipeCell
@synthesize mainImage;
@synthesize videoView;
@synthesize recipeDescription;

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

- (void)setupWithRecipe:(Recipe*)recipe
{
    self.mainView.layer.cornerRadius = 10;
    self.mainView.layer.masksToBounds = YES;
    
    //self.mainImage.image = [UIImage imageNamed:[dictionary valueForKey:@"image"]];
    
    //self.nameLabel.text = [dictionary valueForKey:@"name"];
    //self.titleLabel.text = [dictionary valueForKey:@"location"];
    //self.locationLabel.text = [dictionary valueForKey:@"location"];
    
    //NSString *aboutText = [dictionary valueForKey:@"about"];
    //NSString *newlineString = @"\n";
    // self.aboutLabel.text = [aboutText stringByReplacingOccurrencesOfString:@"\\n" withString:newlineString];
    
 
    
    /*NSString *embedHTML = @"<span style=\"background-color: #fdeee0;\"><iframe width=\"455\" height=\"256\" src=\"//www.youtube.com/embed/dfRE4V27qMM?rel=0\" frameborder=\"0\" allowfullscreen></iframe>";
    
    
    [videoView loadHTMLString:embedHTML baseURL:nil];
    videoView.scrollView.scrollEnabled = NO;
    videoView.scrollView.bounces = NO;
    videoView.contentMode = UIViewContentModeScaleAspectFill;
    
    //[self.view addSubview:test];
    self.videoView.backgroundColor = [UIColor blackColor];
    */
    
    
    //NSString *embedCode = [NSString stringWithFormat:@"%@%@%@",@"<iframe width=\"265\" height=\"140\" src=\"",recipe.video,@"?rel=0\"frameborder=\"0\" allowfullscreen></iframe>"];
    
    [self.recipeDescription setText:recipe.desc];
    [self getImage:recipe];
    //[[self videoView] loadHTMLString:embedCode baseURL:nil]
    
    videoView.scrollView.scrollEnabled = false;
    videoView.scrollView.bounces = false;
}

-(void)getImage:(Recipe*)recipe{
    NSLog(@"1111111111 image url = %@",recipe.image);
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:recipe.image]];
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

