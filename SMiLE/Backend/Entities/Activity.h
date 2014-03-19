//
//  Activity.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 12/03/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient, Location, Product;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) Location *toLocation;
@property (nonatomic, retain) Product *toProduct;
@property (nonatomic, retain) NSSet *toIngredient;
@end

@interface Activity (CoreDataGeneratedAccessors)

- (void)addToIngredientObject:(Ingredient *)value;
- (void)removeToIngredientObject:(Ingredient *)value;
- (void)addToIngredient:(NSSet *)values;
- (void)removeToIngredient:(NSSet *)values;

@end
