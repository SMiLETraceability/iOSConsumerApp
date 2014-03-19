//
//  Location.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 12/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) Activity *toProperty;

@end
