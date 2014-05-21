//
//  RecipeMainCell.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 14/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak,nonatomic) IBOutlet UIWebView *videoView;

@property (weak,nonatomic) IBOutlet UITextView *recipeDescription;

- (void)setupWithRecipe:(Recipe*)recipe;

@end
