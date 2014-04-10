//
//  BAL.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 11/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "BAL.h"

@implementation BAL
@synthesize responseHandler;
@synthesize parentObj;

static BAL *balManager = nil;


+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        balManager = [[self alloc] init];
    });
    return balManager;
}

-(void)loginUser:(NSString*)email withPassword:(NSString*)password{
    NSString *httpString = [NSString stringWithFormat:@"%@%@", API_BASE_URL,API_AUTH_URL];
    NSDictionary *headers = nil;//[NSDictionary dictionaryWithObjectsAndKeys:APP_API_TOKEN,API_TOKEN_KEY,nil];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:email,API_EMAIL_KEY,password,API_PASSWORD_KEY,nil];

    httpCall = login;
    [self doPost:httpString withHeaders:headers andParams:params];
}

/*!
 Request products API call
 */

-(void)fetchProducts{
    NSString *httpString = [NSString stringWithFormat:@"%@%@", API_BASE_URL,API_PRODUCTS_URL];
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:API_TOKEN,API_TOKEN_KEY,nil];
    
    httpCall = products;
    [self doGet:httpString withHeaders:headers];
}

-(void)fetchThngs{
    NSString *httpString = [NSString stringWithFormat:@"%@%@", API_BASE_URL,API_ITEMS_URL];
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:API_TOKEN,API_TOKEN_KEY,nil];
    
    httpCall = products;
    [self doGet:httpString withHeaders:headers];
}

-(void)fetchItemWithID:(NSString*)itemID{
    NSString *httpString = [NSString stringWithFormat:@"%@%@/%@", API_BASE_URL,API_ITEMS_URL,itemID];
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:API_TOKEN,API_TOKEN_KEY,nil];
    
    httpCall = items;
    [self doGet:httpString withHeaders:headers];
}

-(void)fetchProductWithID:(NSString*)productID{
    NSString *httpString = [NSString stringWithFormat:@"%@%@/%@", API_BASE_URL,API_PRODUCTS_URL,productID];
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:API_TOKEN,API_TOKEN_KEY,nil];
    
    httpCall = products;
    [self doGet:httpString withHeaders:headers];
}

-(void)fetchActivityWithID:(NSString*)activityID{
    
}

-(void)fetchActivityForProduct:(NSString*)productID{
    NSString *httpString = [NSString stringWithFormat:@"%@%@%@/%@", API_BASE_URL,API_ACTIVITY_URL,API_PRODUCTS_URL,productID];
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:API_TOKEN,API_TOKEN_KEY,nil];
    
    httpCall = activity;
    [self doGet:httpString withHeaders:headers];
}

#pragma mark -
#pragma mark Base Methods

-(void)doGet:(NSString*)httpURLString withHeaders:(NSDictionary*)headers{
    
    //Reachability * reach = [Reachability reachabilityWithHostname:@"http://google.com"];
    
    //reach.reachableBlock = ^(Reachability * reachability)
    //{
        [[HTTPManager sharedInstance] setResponseHandler:self];
        [[HTTPManager sharedInstance] getRequestForURL:httpURLString withHeaders:headers];
    //};
    
   // reach.unreachableBlock = ^(Reachability * reachability)
    //{
        //[reach stopNotifier];
       // [self displayError:[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObject:@"Network Error"], @"errors",@"Check Internet Connection",@"moreInfo",nil]];
   // };
    
    
   // [reach startNotifier];

}

-(void)doPost:(NSString*)httpURLString withHeaders:(NSDictionary*)headers andParams:(NSDictionary*)params{
    [[HTTPManager sharedInstance] setResponseHandler:self];
    [[HTTPManager sharedInstance] postRequestForURL:httpURLString withHeaders:headers withParams:params];
}

#pragma mark -
#pragma mark API Response Methods

-(void)httpManagerResponse:(NSDictionary *)response withSucess:(BOOL)isSuccess{
    
    //release the delegate
    [[HTTPManager sharedInstance] setResponseHandler:nil];
    
    if(!isSuccess){
        [self displayError:response];
        return;
    }
    
    switch (httpCall) {
        case login:{
            [[CoreDataManager sharedInstance] saveUser:response];
            [[CoreDataManager sharedInstance]saveContext];

            //NSLog(@"API Key is %@",[SMiLEUtility getUserAPIKey]);
  
            break;
        }
        case products:{
            
            //if more than 1 products
            if([response isKindOfClass:[NSArray class]])
            for (NSDictionary *pDict in response)
                [[CoreDataManager sharedInstance] saveProduct:pDict];
            else
                [[CoreDataManager sharedInstance] saveProduct:response];

            [[CoreDataManager sharedInstance]saveContext];

            [responseHandler BALResponse:response withSuccess:YES];
            
            //NSLog(@"JSON: %@", [response class]);
            break;
        }
        case items:{
            NSLog(@"%s %@",__func__, response);
            [[CoreDataManager sharedInstance] saveItem:response];
            [[CoreDataManager sharedInstance]saveContext];

            //todo put save product here
            [responseHandler BALResponse:response withSuccess:YES];
            break;
        }
            
        case activity:{
            NSArray *activities =[response objectForKey:@"activities"];
            
            //if more than 1 products
            for (NSDictionary *aDict in activities)
                    [[CoreDataManager sharedInstance] saveActivity:aDict forProduct:parentObj];
            [[CoreDataManager sharedInstance]saveContext];

            [responseHandler BALResponse:response withSuccess:YES];
            break;
        }
        default:
            break;
    }
    //clean json and send to UI
}

-(void)displayError:(NSDictionary*)alertDict{
    UIAlertView *alertView = nil;
    
    if(alertDict)
        alertView = [[UIAlertView alloc] initWithTitle:[[alertDict objectForKey:@"errors"] objectAtIndex:0] message:[alertDict objectForKey:@"moreInfo"] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    else
        alertView = [[UIAlertView alloc] initWithTitle:@"Ops!" message:@"Network Error!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    [alertView show];
    [responseHandler BALResponse:nil withSuccess:NO];
}

-(void)saveLoginResponse:(NSDictionary*)response{
    [SMiLEUtility saveUserAPIKey:response[@"evrythngApiKey"]];
}
@end
