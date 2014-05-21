 //
//  TraceabilityViewControllerCard.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "TraceabilityViewController.h"

@interface TraceabilityViewController ()
@property (strong, nonatomic) NSArray *members;

@end

@implementation TraceabilityViewController
@synthesize myTableView;
@synthesize members;
@synthesize product;
@synthesize production;
@synthesize recipe;
@synthesize business;

#define NUMBER_OF_OTHER_CELLS = 3; //other cells apart from ingredients, usually business info, production info and the recipe

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TraceabilityTempData" ofType:@"json"]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    self.members = json[@"team"];
  
    //self.myTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [self.myTableView setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    [self loadActivities];
}

-(void)loadActivities{
    [[BAL sharedInstance] setResponseHandler:self];
    [[BAL sharedInstance] setParentObj:product];
    [[BAL sharedInstance] fetchActivityForProduct:product.id];
}

-(void)BALResponse:(NSMutableDictionary *)response withSuccess:(BOOL)isSuccess{
    [[BAL sharedInstance] setResponseHandler:nil];
    [[BAL sharedInstance] setParentObj:nil];
    
    if(isSuccess){
        activitiesArr = [NSMutableArray arrayWithArray:[product.toActivity allObjects]];
        //filter only for recipes
    
       // NSLog(@"recipes >>>>>>>>>>>>>>>\n %@",activitiesArr);
    
        recipe = [[[[[activitiesArr filteredArrayUsingPredicate:
                          [NSPredicate predicateWithFormat:@"type LIKE[cd] 'RECIPE'"]] objectAtIndex:0] toRecipe] allObjects] objectAtIndex:0];
        
        production = [[[[[activitiesArr filteredArrayUsingPredicate:
[NSPredicate predicateWithFormat:@"type LIKE[cd] 'PRODUCTION'"]] objectAtIndex:0] toProductProduction] allObjects] objectAtIndex:0];

        ingredientsArr = [activitiesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type LIKE[cd] 'INGREDIENT'"]];

        
        //NSLog(@"production id >>>>>>>>>>>>>>>\n %@",production.activityID);
        
        [myTableView reloadData];
        [self.myTableView setUserInteractionEnabled:TRUE];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [ingredientsArr count]+3;
//    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
//    NSString *aboutText = members[indexPath.row][@"about"];
    /*
     if(indexPath.row>0)
    {Activity *activity =[recipesArr objectAtIndex:indexPath.row-1];
    Ingredient *ingredient = [[[activity toIngredient]allObjects]objectAtIndex:0];

    NSString *aboutText =ingredient.desc;

    NSString *newlineString = @"\n";
    NSString *newAboutText = [aboutText stringByReplacingOccurrencesOfString:@"\\n" withString:newlineString];
    
    
    CGSize aboutSize = [newAboutText sizeWithFont:font constrainedToSize:CGSizeMake(268, 4000)];
    
    // if deployment target is iOS7 and you want to get rid of the warning above
    // comment the line above and uncomment the following section
    
    // ios 7 only
    /*CGRect boundingRect = [newAboutText boundingRectWithSize:CGSizeMake(268, 4000)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    CGSize boundingSize = boundingRect.size;
    
    return (280-15+boundingSize.height);*/
    // end ios7 only
    

//    return (319-15+aboutSize.height);
    return 350;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        switch (indexPath.row) {
            case 0: //set Business Info
            {
                static NSString *CellIdentifier = @"BusinessInfoCell";
                
                BusinessInfoCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier]; //forIndexPath:indexPath];
                if (cell == nil) {
                    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BusinessInfoCell" owner:self options:nil];
                    //cell = [[BusinessInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                    // More initializations if needed.
                    cell = [topLevelObjects objectAtIndex:0];
                }
                
                [cell setupBusinessCell:business];
                return cell;
                //break;
            }
                
            case 1:
            {
                static NSString *CellIdentifier = @"ProductProductionCell";
                
                ProductProductionCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    // Load the top-level objects from the custom cell XIB.
                    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ProductProductionCell" owner:self options:nil];
                    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                    cell = [topLevelObjects objectAtIndex:0];
                }
                
                [cell setupCell:production];
                return cell;
                
                //            break;
            }
                
            case 2:
            {
                static NSString *CellIdentifier = @"RecipeCell";
                
                RecipeCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    // Load the top-level objects from the custom cell XIB.
                    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RecipeCell" owner:self options:nil];
                    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                    cell = [topLevelObjects objectAtIndex:0];
                }
                
                [cell setupWithRecipe:recipe];
                return cell;
                
                //            break;
            }
                
            case 3:{
                static NSString *CellIdentifier = @"IngredientCell";
                
                IngredientCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier]; //forIndexPath:indexPath];
                
                if (cell == nil) {
                    // Load the top-level objects from the custom cell XIB.
                    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"IngredientCell" owner:self options:nil];
                    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                    cell = [topLevelObjects objectAtIndex:0];
                }
                
                
                [cell setupCell:[ingredientsArr objectAtIndex:0]];
                return cell;
                
                // break;
            }
                
            case 4:{
                static NSString *CellIdentifier = @"IngredientCell";
                
                IngredientCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier]; //forIndexPath:indexPath];
                
                if (cell == nil) {
                    // Load the top-level objects from the custom cell XIB.
                    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"IngredientCell" owner:self options:nil];
                    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                    cell = [topLevelObjects objectAtIndex:0];
                }
                
                
                [cell setupCell:[ingredientsArr objectAtIndex:1]];
                return cell;
                
                // break;
            }
            default:
                break;
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@",__func__,[exception description]);
    }
          // Configure the cell...
    
   // [cell setupWithDictionary:[self.members objectAtIndex:indexPath.row]];
    
    //return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
