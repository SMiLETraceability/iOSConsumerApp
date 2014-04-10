//
//  HTTPManager.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 06/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager
@synthesize data;
@synthesize responseHandler;

static HTTPManager *httpManager = nil;

#pragma mark -
#pragma mark Init

/* Singleton*/
+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[self alloc] init];
    });
    return httpManager;
}

- (void)getRequestForURL:(NSString*)httpURL withHeaders:(NSDictionary*)headers{
    
    ///if(![self connected])
       /// [responseHandler httpManagerResponse:[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObject:@"Network Error"], @"errors",@"Check Internet Connection",@"moreInfo",nil] withSucess:NO];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    for (id key in headers) {
        [manager.requestSerializer setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    [manager GET:httpURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"JSON: %@", responseObject);

        //send response to the caller class - BAL
        [responseHandler httpManagerResponse:responseObject withSucess:YES];
    }
     
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.description);
            [responseHandler httpManagerResponse:[operation responseObject] withSucess:NO];

    }];
}

-(void)postRequestForURL:(NSString*)httpURL withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params{

    //if(![self connected])
      //  [responseHandler httpManagerResponse:[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObject:@"Network Error"], @"errors",@"Check Internet Connection",@"moreInfo",nil] withSucess:NO];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //set json body type
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    for (id key in headers) {
        [manager.requestSerializer setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    [manager POST:httpURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
       // NSLog(@"JSON: %@", responseObject);
        [responseHandler httpManagerResponse:responseObject withSucess:YES];

    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              //NSLog(@"Operation: %@\n\n", [operation description]);
                    //NSLog(@"Error: %@", [operation responseObject]);
              [responseHandler httpManagerResponse:[operation responseObject] withSucess:NO];

          }];


}

/*Check connectivity*/
- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
