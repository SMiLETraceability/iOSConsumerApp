//
//  CoreDataManager.h
//  SMiLE

//  Singleton Class.
// Database manager class

//  Created by Mujtaba Mehdi on 10/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"
#import "Item.h"
#import "User.h"
#import "Activity.h"
#import "Ingredient.h"
#import "Recipe.h"
#import "ProductProduction.h"
#import "Business.h"

@interface CoreDataManager : NSObject{
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;

-(Product*)saveProduct:(NSDictionary*)productDict;
-(Item*)saveItem:(NSDictionary*)itemDict;
-(User*)saveUser:(NSDictionary*)userDict;
-(Business*)saveBusiness:(NSDictionary*)businessDict;
-(Activity*)saveActivity:(NSDictionary*)activityDict forProduct:(Product*)product;
-(NSArray*)fetchProducts;
-(Product*)fetchProductWithID:(NSString*)productID;
-(Item*)fetchItemWithID:(NSString*)itemID;
-(Business*)fetchBusinessWithID:(NSString*)businessID;

-(void)saveItemProductRelation:(Product*)product withItem:(Item*)item;

//Shared Instance of CoreDataManager and ManagedObjectContext
+ (CoreDataManager*)sharedInstance;
- (NSManagedObjectContext*) context;

//Save Context
- (BOOL)saveContext;
@end
