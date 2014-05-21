//
//  TraceabilityViewControllerCard.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessInfoCell.h"
#import "ProductProductionCell.h"
#import "RecipeCell.h"
#import "IngredientCell.h"

@interface TraceabilityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,BALResponseHandler>{
    Activity *businessInfo;
    NSMutableArray *activitiesArr;
    NSArray *ingredientsArr;
}

@property(weak,nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong) Product *product;
@property(nonatomic,strong) ProductProduction *production;
@property(nonatomic,strong) Recipe *recipe;
@property(nonatomic,strong) Business *business;

@end
