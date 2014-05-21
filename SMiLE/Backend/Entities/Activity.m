//
//  Activity.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "Activity.h"
#import "Ingredient.h"
#import "Location.h"
#import "Product.h"
#import "ProductProduction.h"
#import "Recipe.h"


@implementation Activity

@dynamic id;
@dynamic type;
@dynamic toIngredient;
@dynamic toLocation;
@dynamic toProduct;
@dynamic toProductProduction;
@dynamic toRecipe;

@end
