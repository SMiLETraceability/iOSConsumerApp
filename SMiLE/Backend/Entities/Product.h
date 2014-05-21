//
//  Product.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Item, User;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * shortDesc;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *toActivity;
@property (nonatomic, retain) NSSet *toItem;
@property (nonatomic, retain) User *toUser;
@property (nonatomic, retain) NSManagedObject *toBusiness;
@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addToActivityObject:(Activity *)value;
- (void)removeToActivityObject:(Activity *)value;
- (void)addToActivity:(NSSet *)values;
- (void)removeToActivity:(NSSet *)values;

- (void)addToItemObject:(Item *)value;
- (void)removeToItemObject:(Item *)value;
- (void)addToItem:(NSSet *)values;
- (void)removeToItem:(NSSet *)values;

@end
