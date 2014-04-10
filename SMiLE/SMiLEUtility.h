//
//  SMiLEUtility.h
//  SMiLE
//
// Simple utility functions class, used by any other class.
// Manages the user session token

//  Created by Mujtaba Mehdi on 26/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMiLEUtility : NSObject

+(NSDictionary*)stringToJSON:(NSString*)stringData;
+(void)saveUserAPIKey:(NSString*)apiKey;
+(NSString*)getUserAPIKey;

+(void)saveUserID:(NSString*)userID;
+(NSString*)getUserID;

@end
