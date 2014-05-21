//
//  NearbySearchViewController.h
//  SMiLE
//
//  Created by Mujtaba Mehdi on 29/04/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NearbySearchViewController : UIViewController <MKMapViewDelegate,UISearchBarDelegate>

@property(nonatomic,weak) IBOutlet MKMapView *mapView;
@property(nonatomic,weak) IBOutlet UISearchBar *searchBar;
@end
