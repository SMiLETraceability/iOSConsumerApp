//
//  User.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address, Product;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * apiKey;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) Address *toAddress;
@property (nonatomic, retain) NSSet *toProduct;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addToProductObject:(Product *)value;
- (void)removeToProductObject:(Product *)value;
- (void)addToProduct:(NSSet *)values;
- (void)removeToProduct:(NSSet *)values;

@end
