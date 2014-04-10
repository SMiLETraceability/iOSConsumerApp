//
//  ItemOverviewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 18/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "_ItemOverviewControllerOld.h"

@interface _ItemOverviewControllerOld ()

@end

@implementation _ItemOverviewControllerOld
@synthesize tableView;
@synthesize itemImage;
@synthesize itemTitle;
@synthesize item,itemID,productID;
@synthesize itemCell;
@synthesize loadingSpinner;
@synthesize product;

#define TOP_CELL_HEIGHT 160
#define CELL_HEIGHT 50

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithItemID:(NSString*)item_id
{
    NSLog(@"%s",__func__);

    self = [super init];
    if (self) {
        //self.itemID = [[NSString alloc] initWithString:item_id];
        //NSLog(@"%s %@",__func__,itemID);
        // Custom initialization
    }
    NSLog(@"%s %@",__func__,itemID);

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadData];
}

-(void)loadCellTitles{
    cellTitlesArray = [NSMutableArray arrayWithObjects:@"Traceability",@"Share",
                       nil];
}

-(void)loadData{
    isProductCall = FALSE;
    
    [self.loadingSpinner setCenter:self.view.center];
    [self.loadingSpinner startAnimating];
    [self.tableView setUserInteractionEnabled:FALSE];
    
    itemID = @"51";
    
    [self loadCellTitles];
    NSLog(@"%s %@",__func__,self.itemID);
    
    [[BAL sharedInstance] setResponseHandler:self];
    [[BAL sharedInstance] fetchItemWithID:self.itemID];
}

/*-(void)BALResponse:(NSMutableDictionary *)response{
    
    //second call
    if(isProductCall){
        [loadingSpinner stopAnimating];
        [[BAL sharedInstance] setResponseHandler:nil];
        [self.tableView reloadData];
        [self.tableView setUserInteractionEnabled:TRUE];
        product =[[CoreDataManager sharedInstance] fetchProductWithID:productID];
    }
    //first call
    else{
    	item = [[CoreDataManager sharedInstance] fetchItemWithID:itemID];
       // NSLog(@"item name =%@",item.name);
        //[itemTitle setText:item.name];
        //[itemCell.titleLabel setText:item.name];
        productID =[response objectForKey:@"product"];
        [self fetchProduct];
    }
    
   // NSData *imageUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:@""]];
   // [itemCell.imageView setImage:[UIImage imageWithContentsOfFile:<#(NSString *)#>]]
}*/

-(void)BALResponse:(NSMutableDictionary *)response{
    
    //second call


        // NSLog(@"item name =%@",item.name);
        //[itemTitle setText:item.name];
        //[itemCell.titleLabel setText:item.name];
    productID =[[response objectForKey:@"product"] objectForKey:@"id"];
    [[CoreDataManager sharedInstance] saveProduct:[response objectForKey:@"product"]];
//        [self fetchProduct];
    [[CoreDataManager sharedInstance] saveContext];

    [loadingSpinner stopAnimating];
    [[BAL sharedInstance] setResponseHandler:nil];
    
    product =[[CoreDataManager sharedInstance] fetchProductWithID:productID];
    //first call
    
    item = [[CoreDataManager sharedInstance] fetchItemWithID:itemID];
    [self.tableView reloadData];
    [self.tableView setUserInteractionEnabled:TRUE];
    
    // NSData *imageUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:@""]];
    // [itemCell.imageView setImage:[UIImage imageWithContentsOfFile:<#(NSString *)#>]]
}

-(void)fetchProduct{
    isProductCall = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==2)
        return [cellTitlesArray count];
    else
        return 1;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section){
            //setting up the Top cell which contains Image and title
        case 0:{
            static NSString *CellIdentifier = @"ItemTopCell";
            itemCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!itemCell) {
                itemCell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            [itemCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [itemCell setupWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:item, @"item", product, @"product", nil]];
            return itemCell;
            break;
        }
            //setting up rest of the cells
        default:{
            static NSString *CellIdentifier = @"Cell";
            UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            if(indexPath.section==1){
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nutrition_graph"] ]];
            }
            else{
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell.textLabel setText:[cellTitlesArray objectAtIndex:indexPath.row]];
            }
            return cell;
            break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return TOP_CELL_HEIGHT;
    else if(indexPath.section==1)
        return CELL_HEIGHT*2;
    else
        return CELL_HEIGHT;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Nutrition Info";
    else if(section==2)
        return @"Options";
    else
        return @"";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==2) {
        
        //if(indexPath.row==0)
           // [self performSegueWithIdentifier:@"Traceability" sender:nil];
        if (indexPath.row==0)
            [self performSegueWithIdentifier:@"TraceabilityCard" sender:nil];
        if (indexPath.row==1)
            [self performSegueWithIdentifier:@"Feedback" sender:nil];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"Traceability"]){
        _TraceabilityViewController *trace = [[_TraceabilityViewController alloc] init];
        trace=[segue destinationViewController];
    }
    
    if([[segue identifier] isEqualToString:@"TraceabilityCard"]){
        TraceabilityViewController *trace = [[TraceabilityViewController alloc] init];
        trace=[segue destinationViewController];
    }
    
    if([[segue identifier] isEqualToString:@"Feedback"]){
        FeedbackViewController *feedbackView = [[FeedbackViewController alloc] init];
        feedbackView=[segue destinationViewController];
    }
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

@end
