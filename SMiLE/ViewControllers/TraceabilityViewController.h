//
//  TraceabilityViewControllerCard.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardCell.h"
#import "RecipeCell.h"
#import "IngredientCell.h"

@interface TraceabilityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,BALResponseHandler>{
    Activity *businessInfo;
    NSMutableArray *recipesArr;
    NSMutableArray *recipesArr2;
}

@property(weak,nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong) Product *product;
@end
