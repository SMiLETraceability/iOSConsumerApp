//
//  Ingredient.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * activityID;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * producer;
@property (nonatomic, retain) NSString * timestamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Activity *toActivity;

@end
