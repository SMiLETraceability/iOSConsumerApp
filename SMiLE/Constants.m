//
//  Constants.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 07/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#pragma mark API Constants Values

//NSString *const EVRYTHING_API_TOKEN =  @"UPLogSB3XTx2r0edQ7WVcTHn8eisStFfxxDAjMzjxX49rlbNDJ1tq5LRu9psHIqpikjGpxl8Yx0zT4Ev";
//NSString *const EVRYTHING_APP_API_TOKEN = @"kXY8kvxL9kCbc8rPNf3Ehxb6uADiYK0hNqaXCQff497EjXwAcPRkKSWXNCVfJIhrgiKEdKjpxwPgdBAa";

NSString *const API_TOKEN =  @"aba778b08bf5d2376ce2c7bd0be60ba7";

//NSString *const APP_API_TOKEN = @"b2ded822d95d94b7ae45e5341ec0f6ec";

//NSString *const EVRYTHING_API_BASE_URL = @"https://api.evrythng.com";
//NSString *const EVRYTHING_API_BASE_URL = @"http://139.133.73.55:9090/smile-server/api-1.0";

//NSString *const API_BASE_URL = @"http://smile.abdn.ac.uk:8081/smile-server/api-1.0";
NSString *const API_BASE_URL = @"http://smile.abdn.ac.uk:8080/smile-server/api-1.1";
NSString *const API_ITEMS_URL = @"/item";
//NSString *const EVRYTHING_API_ITEMS_URL = @"/thngs";
NSString *const API_BUSINESS_URL = @"/business";
NSString *const API_PRODUCTS_URL = @"/product";
NSString *const API_ACTIVITY_URL = @"/activity";
NSString *const API_AUTH_URL = @"/auth";
NSString *const API_LOGOUT_URL = @"/auth/all/logout";
NSString *const API_USERS_URL = @"/users";

#pragma mark API Request Keys
NSString *const API_TOKEN_KEY = @"ApplicationAuthorization";
NSString *const API_EMAIL_KEY = @"email";
NSString *const API_PASSWORD_KEY = @"password";

#pragma mark JSON Response Keys
NSString *const JSON_PRODUCT_ID_KEY = @"id";
NSString *const JSON_PRODUCT_FN_TITLE_KEY = @"fn";
NSString *const JSON_PRODUCT_PHOTOS_KEY = @"photos";
NSString *const JSON_PRODUCT_DESCRIPTION_KEY = @"description";
NSString *const JSON_PRODUCT_BRAND_KEY = @"brand";
NSString *const JSON_PRODUCT_PROPERTIES_KEY = @"properties";

NSString *const JSON_ITEM_ID_KEY = @"id";
NSString *const JSON_ITEM_NAME_KEY = @"name";

NSString *const JSON_USER_EMAIL_KEY = @"email";
NSString *const JSON_USER_API_KEY = @"userApiKey";
NSString *const JSON_USER_ID_KEY = @"evrythngUser";
NSString *const JSON_USER_STATUS_KEY = @"evrythngUser";

NSString *const JSON_BUSINESS_EMAIL_KEY = @"email";
NSString *const JSON_BUSINESS_TITLE_KEY = @"name";
NSString *const JSON_BUSINESS_DESCRIPTION_KEY = @"description";
NSString *const JSON_BUSINESS_ID_KEY = @"id";
NSString *const JSON_BUSINESS_IMAGE_KEY = @"photos";
NSString *const JSON_BUSINESS_TELEPHONE_KEY = @"telephone";
NSString *const JSON_BUSINESS_WEBSITE_KEY = @"";
NSString *const JSON_BUSINESS_ADDRESS_KEY = @"address";

NSString *const JSON_ACTIVITY_ID_KEY = @"id";
NSString *const JSON_ACTIVITY_TYPE_KEY = @"type";
NSString *const JSON_ACTIVITY_CONTEXT_KEY = @"context";

NSString *const JSON_INGREDIENT_PRODUCER_KEY = @"producer";
NSString *const JSON_INGREDIENT_IMAGE_KEY = @"image";
NSString *const JSON_INGREDIENT_TITLE_KEY = @"name";
NSString *const JSON_INGREDIENT_DESCRIPTION_KEY = @"description";
NSString *const JSON_INGREDIENT_LOCATION_KEY = @"location";

NSString *const JSON_RECIPE_DESCRIPTION_KEY = @"description";
NSString *const JSON_RECIPE_IMAGE_KEY = @"image";
NSString *const JSON_RECIPE_VIDEO_KEY = @"video";

NSString *const JSON_PRODUCTION_DESCRIPTION_KEY = @"description";
NSString *const JSON_PRODUCTION_VIDEO_KEY = @"video";

#pragma mark CoreData Keys
NSString *const ENTITY_PRODUCT_KEY = @"Product";
NSString *const ATTRIBUTE_PRODUCT_ID_KEY = @"id";
NSString *const ATTRIBUTE_PRODUCT_TITLE_KEY=@"title";
NSString *const ATTRIBUTE_PRODUCT_DESCRIPTION_KEY=@"shortDesc";
NSString *const ATTRIBUTE_PRODUCT_IMAGEURL_KEY=@"imageURL";

NSString *const ENTITY_ITEM_KEY = @"Item";
NSString *const ATTRIBUTE_ITEM_ID_KEY = @"id";

NSString *const ENTITY_USER_KEY = @"User";
NSString *const ATTRIBUTE_USER_EMAIL_KEY = @"email";
NSString *const ATTRIBUTE_USER_ID_KEY = @"id";
NSString *const ATTRIBUTE_USER_TELEPHONE_KEY = @"telephone";
NSString *const ATTRIBUTE_USER_API_KEY = @"apiKey";
NSString *const ATTRIBUTE_USER_STATUS_KEY = @"status";

NSString *const ENTITY_BUSINESS_KEY = @"Business";
NSString *const ATTRIBUTE_BUSINESS_TITLE_KEY = @"title";
NSString *const ATTRIBUTE_BUSINESS_DESCRIPTION_KEY = @"businessDescription";
NSString *const ATTRIBUTE_BUSINESS_EMAIL_KEY = @"email";
NSString *const ATTRIBUTE_BUSINESS_ID_KEY = @"businessID";
NSString *const ATTRIBUTE_BUSINESS_TELEPHONE_KEY = @"telephone";
NSString *const ATTRIBUTE_BUSINESS_IMAGE_KEY = @"image";
NSString *const ATTRIBUTE_BUSINESS_WEBSITE_KEY = @"website";

NSString *const ENTITY_ACTIVITY_KEY = @"Activity";
NSString *const ATTRIBUTE_ACTIVITY_ID_KEY = @"id";
NSString *const ATTRIBUTE_ACTIVITY_TYPE_KEY=@"type";

NSString *const ENTITY_INGREDIENT_KEY = @"Ingredient";
NSString *const ATTRIBUTE_INGREDIENT_ID_KEY=@"activityID";
NSString *const ATTRIBUTE_INGREDIENT_DESCRIPTION_KEY=@"desc";
NSString *const ATTRIBUTE_INGREDIENT_TITLE_KEY=@"title";
NSString *const ATTRIBUTE_INGREDIENT_IMAGEURL_KEY=@"imageURL";
NSString *const ATTRIBUTE_INGREDIENT_PRODUCER_KEY=@"producer";
NSString *const ATTRIBUTE_INGREDIENT_TIMESTAMP_KEY=@"timestamp";
NSString *const ATTRIBUTE_INGREDIENT_LOCATION_KEY=@"location";

NSString *const ENTITY_RECIPE_KEY = @"Recipe";
NSString *const ATTRIBUTE_RECIPE_ID_KEY=@"activityID";
NSString *const ATTRIBUTE_RECIPE_DESCRIPTION_KEY=@"desc";
NSString *const ATTRIBUTE_RECIPE_VIDEO_KEY=@"video";
NSString *const ATTRIBUTE_RECIPE_IMAGE_KEY = @"image";

NSString *const ENTITY_PRODUCT_PRODUCTION_KEY = @"ProductProduction";
NSString *const ATTRIBUTE_PRODUCT_PRODUCTION_ID_KEY=@"activityID";
NSString *const ATTRIBUTE_PRODUCT_PRODUCTION_DESCRIPTION_KEY=@"desc";
NSString *const ATTRIBUTE_PRODUCT_PRODUCTION_VIDEO_KEY=@"video";

#pragma mark Error Messages
NSString *const STATUS_CODE_401=@"Login to continue!";
