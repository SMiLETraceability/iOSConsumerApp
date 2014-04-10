//
//  TraceabilityViewController.m
//  SMiLE
//
//  Created by Mujtaba Mehdi on 18/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import "_TraceabilityViewController.h"

@interface _TraceabilityViewController ()

@end

@implementation _TraceabilityViewController
@synthesize _array,myCollectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    _array=[NSMutableArray array];
    for (int a=0; a<=30; a++) {
        [_array addObject:[NSString stringWithFormat:@"button %d",a]];
    }
    myCollectionView=[[WKPagesCollectionView alloc]initWithPagesFlowLayoutAndFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    myCollectionView.dataSource=self;
    myCollectionView.delegate=self;
    [myCollectionView registerClass:[WKPagesCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:myCollectionView];
    myCollectionView.maskShow=YES;

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onButtonTitle:(id)sender{
    NSLog(@"button");
    [myCollectionView dismissFromHightLightWithCompletion:^(BOOL finished) {
        NSLog(@"dismiss completed");
    }];
}

#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _array.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"cellForItemAtIndexPath:%d",indexPath.row);
    static NSString* identity=@"cell";
    WKPagesCollectionViewCell* cell=(WKPagesCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    cell.collectionView=collectionView;
    UIImageView* imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sample-1"]];
    imageView.frame=self.view.bounds;
    [cell.cellContentView addSubview:imageView];
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, (indexPath.row+1)*10+100, 320, 50.0f);
    button.backgroundColor=[UIColor whiteColor];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitle:_array[indexPath.row] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonTitle:) forControlEvents:UIControlEventTouchUpInside];
    [cell.cellContentView addSubview:button];
    return cell;
}
#pragma mark WKPagesCollectionViewDataSource
-(void)willAppendItemInCollectionView:(WKPagesCollectionView *)collectionView{
}
-(void)collectionView:(WKPagesCollectionView *)collectionView willRemoveCellAtNSIndexPath:(NSIndexPath *)indexPath{
}
@end
