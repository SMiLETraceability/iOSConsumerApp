//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Simon on 13/1/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "GalleryCollectionViewController.h"

@interface GalleryCollectionViewController () {
    NSArray *recipeImages;
}

@end

@implementation GalleryCollectionViewController
@synthesize myCollectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Initialize recipe image array
    recipeImages = [NSArray arrayWithObjects:@"glen_ample_raspberry.png", @"lairig_ghru_cheese.png",@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"GalleryCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GalleryCollectionCell"];
    
   // [self.myCollectionView registerClass:[GalleryCollectionCell class] forCellWithReuseIdentifier:@"GalleryCollectionCell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return recipeImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"GalleryCollectionCell";
    
    GalleryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    //UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];

    [cell.imageView setImage:[UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]]];
    
    switch (indexPath.row) {
        case 0: //berry
            [cell.titleLabel setText:@"Glen Ample Raspberry"];
            break;
        case 1: //cheese
            [cell.titleLabel setText:@"Lochnagar Cheese"];
            break;
        default:
            break;
    }
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: //berry
            itemID = @"1010";
            [self performSegueWithIdentifier:@"GalleryToItemView" sender:nil];
            break;
        case 1: //cheese
            itemID = @"1099";
            [self performSegueWithIdentifier:@"GalleryToItemView" sender:nil];
            break;
        default:
            break;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"GalleryToItemView"])
    {
        ItemViewController *itemView = [[ItemViewController alloc] init];
        itemView = [segue destinationViewController];
        [itemView setItemID:itemID];
    }
}

@end
