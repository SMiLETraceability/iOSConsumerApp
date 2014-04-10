//
//  SMiLEUtility.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 26/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "SMiLEUtility.h"

@implementation SMiLEUtility

+(NSDictionary*)stringToJSON:(NSString*)stringData{
    NSData *data = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return json;
}

+(void)saveUserAPIKey:(NSString*)apiKey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:apiKey forKey:@"USER_API_KEY"];
}
+(void)saveUserID:(NSString*)userID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userID forKey:@"USER_ID"];
}
+(NSString*)getUserAPIKey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"USER_API_KEY"];
}
+(NSString*)getUserID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"USER_ID"];
}
@end
