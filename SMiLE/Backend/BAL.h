//
//  BAL.h
//  SMiLE
//
// Business Access Layer class. This class contains all the necessary API data methods
// This class is not thread safe.

//  Created by Mujtaba Mehdi on 11/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

/*Last http call type*/
enum callType
{
    products, // == 0
    items, // == 1
    login, // == 2
    activity, // ==3
    business //4
};


/*
 Business Access Layer response delegate. Implemented by the class using Business Access Layer methods to respond
 */
@protocol BALResponseHandler <NSObject>
@optional
-(void)BALResponse:(NSDictionary*)response withSuccess:(BOOL)isSuccess;
@end

/* BAL class declaration*/
@interface BAL : NSObject <HTTPManagerResponseHandler>{
    enum callType httpCall;
}

@property(nonatomic,weak) id<BALResponseHandler>responseHandler;
@property(nonatomic,weak) Product *parentObj;

/*static method to return singleton */
+(BAL*)sharedInstance;


/*API Calls*/
-(void)loginUser:(NSString*)email withPassword:(NSString*)password;
-(void)fetchProducts;
-(void)fetchItemWithID:(NSString*)itemID;
-(void)fetchProductWithID:(NSString*)productID;
-(void)fetchActivityForProduct:(NSString*)productID;
-(void)fetchBusinessWithID:(NSString*)businessID;
@end
