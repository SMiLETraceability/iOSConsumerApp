//
//  HTTPManager.h
//  SMiLE
//
//  Singleton Class.
// This class handles HTTP requests (GET,POST,PUT) and uses AFNetworking library
//
//  Created by Mujtaba Mehdi on 06/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/*Last http call type*/
enum HTTPCode
{
    success = 200,
    authFail = 401 // == 0
};

/* HTTPManager Protocal Delegate. Implemented by the class using HTTPManager*/
@protocol HTTPManagerResponseHandler
@optional
- (void)httpManagerResponse:(NSDictionary*)response withSucess:(BOOL)isSuccess;

@end

/*HTTPManager Class Declaration*/
@interface HTTPManager : NSObject{
     enum HTTPCode httpCode;
}

@property(strong,nonatomic) NSMutableDictionary *data;
@property(nonatomic,weak) id<HTTPManagerResponseHandler>responseHandler;

/*static method to return singleton */
+(HTTPManager*)sharedInstance;

/*Get and Post methods*/
-(void)getRequestForURL:(NSString*)httpURL withHeaders:(NSDictionary*)headers;
-(void)postRequestForURL:(NSString*)httpURL withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params;
@end
