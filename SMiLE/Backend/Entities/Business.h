//
//  Business.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 21/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Business : NSManagedObject

@property (nonatomic, retain) NSString * businessDescription;
@property (nonatomic, retain) NSString * businessID;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSSet *toProduct;
@end

@interface Business (CoreDataGeneratedAccessors)

- (void)addToProductObject:(Product *)value;
- (void)removeToProductObject:(Product *)value;
- (void)addToProduct:(NSSet *)values;
- (void)removeToProduct:(NSSet *)values;

@end
