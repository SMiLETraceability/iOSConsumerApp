//
//  Media.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 08/05/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Media : NSManagedObject

@property (nonatomic, retain) NSString * mediaURL;
@property (nonatomic, retain) NSString * type;

@end
