//
//  GalleryCollectionViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 25/04/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryCollectionCell.h"
#import "ItemViewController.h"

@interface GalleryCollectionViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>{
    NSString *itemID;
}
@property (nonatomic,weak) IBOutlet UICollectionView *myCollectionView;
@end
