//
//  TraceabilityViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 18/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKPagesCollectionView.h"

@interface _TraceabilityViewController : UIViewController <WKPagesCollectionViewDataSource,WKPagesCollectionViewDelegate>{

}
@property(nonatomic,strong) IBOutlet WKPagesCollectionView *myCollectionView;
@property(nonatomic,strong) NSMutableArray *_array;
@end
