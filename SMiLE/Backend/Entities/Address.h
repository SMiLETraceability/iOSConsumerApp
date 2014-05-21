//
//  Address.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Address : NSManagedObject

@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) User *toUser;

@end
