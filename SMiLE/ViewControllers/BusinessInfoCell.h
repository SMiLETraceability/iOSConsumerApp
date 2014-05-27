//
//  CardCell.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 19/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.

// Implments the Card cell for Business Info in Traceability View
//

#import <UIKit/UIKit.h>

@interface BusinessInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1Value;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2Value;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

//@property (weak, nonatomic) IBOutlet UIImageView *farmLocation;
@property (weak, nonatomic) IBOutlet MKMapView *farmLocation;

- (void)setupWithDictionary:(NSDictionary *)dictionary;
-(void)setupBusinessCell:(Business*)business;

@end
