//
//  ScanViewController.h
//  SMiLE
//
// This class implements QR Code scanning
// Requires minimum iOS SDK 7.0

//  Created by Mujtaba Mehdi on 24/02/2014.
//  Copyright (c) 2014 Dot Rural. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "_ItemOverviewControllerOld.h"
#import "ItemViewController.h"

@protocol ScanViewControllerDelegate;

@interface ScanViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>{
    NSString *itemID;
}

@property (nonatomic, weak) id<ScanViewControllerDelegate> delegate;

@property (assign, nonatomic) BOOL touchToFocusEnabled;

- (BOOL) isCameraAvailable;
- (void) startScanning;
- (void) stopScanning;
- (void) setTourch:(BOOL) aStatus;

@end

@protocol ScanViewControllerDelegate <NSObject>

@optional

- (void) scanViewController:(ScanViewController *) aCtler didTabToFocusOnPoint:(CGPoint) aPoint;
- (void) scanViewController:(ScanViewController *) aCtler didSuccessfullyScan:(NSString *) aScannedValue;

@end