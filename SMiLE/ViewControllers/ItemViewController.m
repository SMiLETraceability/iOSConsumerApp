//
//  ItemViewControllerNew.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 10/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "ItemViewController.h"
#import <Social/Social.h>

@interface ItemViewController ()

@end

@implementation ItemViewController
@synthesize loadingSpinner;
@synthesize itemImage;
@synthesize itemTitle;
@synthesize producerTitle;
@synthesize countryFlag;
@synthesize itemDescription;
@synthesize item;
@synthesize product;
@synthesize itemID;
@synthesize productID;
@synthesize itemTextViewDesc;

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
    
    [self loadData];
	// Do any additional setup after loading the view.
}

-(void)loadData{
    
    [self.loadingSpinner setCenter:self.view.center];
    [self.loadingSpinner startAnimating];
    
    //itemID = @"9";
    
    [self prepareItemFetch];
    [[BAL sharedInstance] setResponseHandler:self];
    [[BAL sharedInstance] fetchItemWithID:self.itemID];
}
-(void)prepareItemFetch{
    NSArray *urlParts = [itemID componentsSeparatedByString:@"/"];
    itemID =  [urlParts objectAtIndex:[urlParts count]-1];
}

-(void)BALResponse:(NSDictionary *)response withSuccess:(BOOL)isSuccess{
    [[BAL sharedInstance] setResponseHandler:nil];
    [loadingSpinner stopAnimating];
    [loadingSpinner setHidden:YES];

    if(isSuccess){
        productID =[[response objectForKey:@"product"] objectForKey:@"id"];
        [[CoreDataManager sharedInstance] saveProduct:[response objectForKey:@"product"]];
        [[CoreDataManager sharedInstance] saveContext];
    
        product =[[CoreDataManager sharedInstance] fetchProductWithID:productID];
        item = [[CoreDataManager sharedInstance] fetchItemWithID:itemID];
        [self setUIData];
    }

}

-(void)setUIData{
    @try {
        //set image
        NSString *imageURL = [product.imageURL substringToIndex:[product.imageURL length]-1];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
        itemImage.image = [UIImage imageWithData:imageData];
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@",__func__,[exception description]);
    }

    [itemTitle setText:product.title];
    //[itemDescription setText:product.shortDesc];
    [itemTextViewDesc setText:product.shortDesc];
    
//   [producerTitle setText:product.toUser];
     [producerTitle setText:@"Berry Scrumptious, UK"];

}

-(IBAction)openTraceability:(id)sender{
    [self performSegueWithIdentifier:@"DetailToTraceabilityView" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"DetailToTraceabilityView"]){
        // ItemOverviewController *itemView = [[ItemOverviewController alloc] init];
        TraceabilityViewController *traceView = [[TraceabilityViewController alloc] init];
        traceView = [segue destinationViewController];
        [traceView setProduct:product];
    }
}

/*- (IBAction)shareBtnTapped:(id)sender
{
    // Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
	SHKItem *shareItem = [SHKItem URL:url title:@"check this out" contentType:SHKURLContentTypeWebpage];
   // [shareItem setImage:itemImage.image];
	


	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:shareItem];

    [SHK setRootViewController:self];
   // [actionSheet showInView:self.view];
	//[actionSheet showFromToolbar:self.navigationController.toolbar];
    //[actionSheet showInView:[UIApplication sharedApplication].keyWindow];

    [actionSheet showInView:self.parentViewController.view];
}*/

- (IBAction)shareBtnTapped:(id)sender
 {
     UIActionSheet *shareActionSheet = [[UIActionSheet alloc] initWithTitle:@"Share" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter",nil];
    
     [shareActionSheet showInView:[UIApplication sharedApplication].keyWindow];
 }

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"facebook");
            [self postToFacebook];
            break;
        case 1:
            NSLog(@"twitter");
            [self postToTwitter];
        default:
            break;
    }
}

- (void)postToTwitter{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *twitterController = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterController setInitialText:@"Just bought this from XYZ"];
        [twitterController addURL:[NSURL URLWithString:@"http://dotrural.ac.uk"]];
        [twitterController addImage:itemImage.image];
        [self presentViewController:twitterController animated:YES completion:nil];
    }
}

- (void)postToFacebook{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbController setInitialText:@"Just bought this from XYZ"];
        [fbController addURL:[NSURL URLWithString:@"http://dotrural.ac.uk"]];
        [fbController addImage:itemImage.image];
        
        [self presentViewController:fbController animated:YES completion:Nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
