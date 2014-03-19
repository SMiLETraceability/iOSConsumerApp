//
//  Item.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 11/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Product *toProduct;

@end
