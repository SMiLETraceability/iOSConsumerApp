//
//  CoreDataManager.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 10/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

static CoreDataManager *CDManager = nil;

static NSString *initials = @"SMiLE";

#pragma mark -
#pragma mark Init

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CDManager = [[self alloc] init];
    });
    return CDManager;
}

- (NSManagedObjectContext*) context
{
    return self.managedObjectContext;
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil)
    {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */

- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:initials withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:initials,@".sqlite"]];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
    // If the expected store doesn't exist, copy the default store.
	if (![fileManager fileExistsAtPath:storePath]) {
		NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:initials ofType:@"sqlite"];
		if (defaultStorePath) {
			[fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
		}
	}
	NSURL *storeURL = [NSURL fileURLWithPath:storePath];
	
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return persistentStoreCoordinator;
}


#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
}

#pragma mark -
#pragma mark Save Methods

-(Product*)saveProduct:(NSDictionary*)productDict{
	
	Product *product = nil;

	@try {
		product = [self fetchProductWithID:[productDict objectForKey:JSON_PRODUCT_ID_KEY]];
		if(!product) {
			product = (Product*)[NSEntityDescription insertNewObjectForEntityForName:ENTITY_PRODUCT_KEY inManagedObjectContext:self.managedObjectContext];
			[product setId:[[productDict objectForKey:JSON_PRODUCT_ID_KEY] stringValue]];
		}
		[product setTitle:[productDict objectForKey:JSON_PRODUCT_FN_TITLE_KEY]];
        [product setImageURL:[[productDict objectForKey:JSON_PRODUCT_PHOTOS_KEY]objectAtIndex:0]];
        [product setShortDesc:[productDict objectForKey:JSON_PRODUCT_DESCRIPTION_KEY]];
        
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return product;
	}
}

-(Item*)saveItem:(NSDictionary*)itemDict{
	
	Item *item = nil;
    
	@try {
		item = [self fetchItemWithID:[itemDict objectForKey:JSON_ITEM_ID_KEY]];
		if(!item) {
			item = (Item*)[NSEntityDescription insertNewObjectForEntityForName:ENTITY_ITEM_KEY inManagedObjectContext:self.managedObjectContext];
			[item setId:[[itemDict objectForKey:JSON_ITEM_ID_KEY] stringValue]];
		}
        
        [item setName:[itemDict objectForKey:JSON_ITEM_NAME_KEY]];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return item;
	}
}

-(void)saveItemProductRelation:(Product*)product withItem:(Item*)item{
    [product addToItemObject:item];
    [item setToProduct:product];
}

-(User*)saveUser:(NSDictionary*)userDict{
	
	User *user = nil;
    
	@try {
		user = [self fetchUserWithEmail:[userDict objectForKey:JSON_USER_EMAIL_KEY]];
		if(!user) {
			user = (User*)[NSEntityDescription insertNewObjectForEntityForName:ENTITY_USER_KEY inManagedObjectContext:self.managedObjectContext];
			//[user setId:[[userDict objectForKey:JSON_USER_ID_KEY] stringValue]];
            [user setEmail:[userDict objectForKey:JSON_USER_EMAIL_KEY]];
		}
        //[user setApiKey:[[userDict objectForKey:JSON_USER_API_KEY] stringValue]];
       // [user setStatus:[[userDict objectForKey:JSON_USER_STATUS_KEY] stringValue]];
        
        [SMiLEUtility saveUserAPIKey:[userDict objectForKey:JSON_USER_API_KEY]];

	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return user;
	}
}

-(Activity*)saveActivity:(NSDictionary*)activityDict forProduct:(Product*)product{
	
	Activity *activity = nil;
    
	@try {
		activity = [self fetchActivityWithID:[activityDict objectForKey:JSON_ACTIVITY_ID_KEY]];
		if(!activity) {
			activity = (Activity*)[NSEntityDescription insertNewObjectForEntityForName:ENTITY_ACTIVITY_KEY inManagedObjectContext:self.managedObjectContext];
			[activity setId:[[activityDict objectForKey:JSON_ACTIVITY_ID_KEY] stringValue]];
            [activity setType:[activityDict objectForKey:JSON_ACTIVITY_TYPE_KEY]];
            

		}
        
        //case recipe
        Ingredient *ingredient = [self saveIngredient:[activityDict objectForKey:JSON_INGREDIENT_CONTEXT_KEY] forActivity:activity.id];
        
        [activity addToIngredientObject:ingredient];
        [ingredient setToActivity:activity];
        
        [product addToActivityObject:activity];
        [activity setToProduct:product];
        
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return activity;
	}
}

-(Ingredient*)saveIngredient:(NSDictionary*)ingredientDict forActivity:(NSString*)activityID{
	
	Ingredient *ingredient = nil;
    
	@try {
        ingredient = [self fetchIngredientWithID:activityID];

        if(!ingredient){
            ingredient = (Ingredient*)[NSEntityDescription insertNewObjectForEntityForName:ENTITY_INGREDIENT_KEY inManagedObjectContext:self.managedObjectContext];
        }
        [ingredient setTitle:[ingredientDict objectForKey:JSON_INGREDIENT_TITLE_KEY]];
        [ingredient setProducer:[ingredientDict objectForKey:JSON_INGREDIENT_PRODUCER_KEY]];
        [ingredient setImageURL:[ingredientDict objectForKey:JSON_INGREDIENT_IMAGE_KEY]];
        [ingredient setLocation:[ingredientDict objectForKey:JSON_INGREDIENT_LOCATION_KEY]];
        [ingredient setDesc:[ingredientDict objectForKey:JSON_INGREDIENT_DESCRIPTION_KEY]];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return ingredient;
	}
}

#pragma mark -
#pragma mark Fetch Methods
-(Product*)fetchProductWithID:(NSString*)productID{
	
	NSArray *fetchRecords = nil;
	Product *product = nil;
	
	@try {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", ATTRIBUTE_PRODUCT_ID_KEY, productID];
		
		fetchRecords = [self fetchRecords:ENTITY_PRODUCT_KEY
							withPredicate:predicate
						  withFetchOffset:0
						   withFetchLimit:1
								   sortBy:ATTRIBUTE_PRODUCT_ID_KEY
								assending:YES];
		if([fetchRecords count])
			product = [fetchRecords objectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return product;
	}
	
}

-(User*)fetchUserWithEmail:(NSString*)userEmail{
	
	NSArray *fetchRecords = nil;
	User *user = nil;
	
	@try {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", ATTRIBUTE_USER_EMAIL_KEY, userEmail];
		
		fetchRecords = [self fetchRecords:ENTITY_USER_KEY
							withPredicate:predicate
						  withFetchOffset:0
						   withFetchLimit:1
								   sortBy:ATTRIBUTE_USER_EMAIL_KEY
								assending:YES];
		if([fetchRecords count])
			user = [fetchRecords objectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return user;
	}
	
}

-(Activity*)fetchActivityWithID:(NSString*)activityID{
	
	NSArray *fetchRecords = nil;
	Activity *activity = nil;
	
	@try {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", ATTRIBUTE_ACTIVITY_ID_KEY, activityID];
		
		fetchRecords = [self fetchRecords:ENTITY_ACTIVITY_KEY
							withPredicate:predicate
						  withFetchOffset:0
						   withFetchLimit:1
								   sortBy:ATTRIBUTE_ACTIVITY_ID_KEY
								assending:YES];
		if([fetchRecords count])
			activity = [fetchRecords objectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return activity;
	}
	
}

-(Ingredient*)fetchIngredientWithID:(NSString*)activityID{
	
	NSArray *fetchRecords = nil;
	Ingredient *ingredient = nil;
	
	@try {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", ATTRIBUTE_INGREDIENT_ID_KEY, activityID];
		
		fetchRecords = [self fetchRecords:ENTITY_INGREDIENT_KEY
							withPredicate:predicate
						  withFetchOffset:0
						   withFetchLimit:1
								   sortBy:ATTRIBUTE_INGREDIENT_ID_KEY
								assending:YES];
		if([fetchRecords count])
			ingredient = [fetchRecords objectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return ingredient;
	}
	
}

-(Item*)fetchItemWithID:(NSString*)itemID{
	
	NSArray *fetchRecords = nil;
	Item *item = nil;
	
	@try {
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", ATTRIBUTE_ITEM_ID_KEY, itemID];
		
		fetchRecords = [self fetchRecords:ENTITY_ITEM_KEY
							withPredicate:predicate
						  withFetchOffset:0
						   withFetchLimit:1
								   sortBy:ATTRIBUTE_ITEM_ID_KEY
								assending:YES];
		if([fetchRecords count])
			item = [fetchRecords objectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return item;
	}
	
}

-(NSArray*)fetchProducts{
	
	NSArray *fetchRecords = nil;
	
	@try {
		fetchRecords = [self fetchRecords:ENTITY_PRODUCT_KEY
							withPredicate:nil
						  withFetchOffset:0
						   withFetchLimit:0
								   sortBy:ATTRIBUTE_PRODUCT_ID_KEY
								assending:YES];
	}
	@catch (NSException * e) {
		NSLog(@"%s %@",__func__, [e description]);
	}
	@finally {
		return fetchRecords;
	}
	
}


#pragma mark -
#pragma mark fetchedRecords

- (NSArray*)fetchRecords:(NSString*)tableName
           withPredicate:(NSPredicate*)predicate
         withFetchOffset:(NSInteger)fetchOffset
          withFetchLimit:(NSInteger)fetchLimit
                  sortBy:(NSString*)sortColumn
               assending:(BOOL)isAssending

{
    NSArray *fetchResults = nil;
    @try {
        
        // Define our table/entity to use
        NSEntityDescription *entity = [NSEntityDescription entityForName:tableName inManagedObjectContext:self.managedObjectContext];
        // Setup the fetch request
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entity];
        
        //Set fetch Limit and fetch Offset
        if(fetchLimit>0)
            [request setFetchLimit:fetchLimit];
        if(fetchOffset>0)
            [request setFetchOffset:fetchOffset];
        
        //Set optionol parameters//
        if(sortColumn)
        {
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortColumn ascending:isAssending];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
            if(sortDescriptors) {
                [request setSortDescriptors:sortDescriptors];
            }//if sortDescriptors
        }
        
        if(predicate)
            [request setPredicate:predicate];
        //optional parameters//
        
        
        // Fetch the records and handle an error
        NSError *error;
        
        fetchResults = [NSArray arrayWithArray:[self.managedObjectContext executeFetchRequest:request error:&error]];
        //NSLog(@"%s fetchResults %@", __func__, fetchResults);
    }
    @catch (NSException *exception) {
        NSLog(@"func :%s exception : %@",__func__,[exception description]);
    }
    @finally {
        return fetchResults;
    }
}
#pragma mark -
#pragma mark Save Context

- (BOOL)saveContext
{
	BOOL isSuccess = YES;
    NSError *error = nil;
    if (self.managedObjectContext != nil) {
        
		[[[CoreDataManager sharedInstance] context] lock];
        
        if ([self.managedObjectContext hasChanges] &&
            ![self.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //return NO;
			isSuccess = NO;
        }
		
		[[[CoreDataManager sharedInstance] context] unlock];
    }
    return isSuccess;
}

@end