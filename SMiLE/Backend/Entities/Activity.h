//
//  Activity.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient, Location, Product, ProductProduction, Recipe;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *toIngredient;
@property (nonatomic, retain) Location *toLocation;
@property (nonatomic, retain) Product *toProduct;
@property (nonatomic, retain) NSSet *toProductProduction;
@property (nonatomic, retain) NSSet *toRecipe;
@end

@interface Activity (CoreDataGeneratedAccessors)

- (void)addToIngredientObject:(Ingredient *)value;
- (void)removeToIngredientObject:(Ingredient *)value;
- (void)addToIngredient:(NSSet *)values;
- (void)removeToIngredient:(NSSet *)values;

- (void)addToProductProductionObject:(ProductProduction *)value;
- (void)removeToProductProductionObject:(ProductProduction *)value;
- (void)addToProductProduction:(NSSet *)values;
- (void)removeToProductProduction:(NSSet *)values;

- (void)addToRecipeObject:(Recipe *)value;
- (void)removeToRecipeObject:(Recipe *)value;
- (void)addToRecipe:(NSSet *)values;
- (void)removeToRecipe:(NSSet *)values;

@end
