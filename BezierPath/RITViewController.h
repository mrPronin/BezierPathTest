//
//  RITViewController.h
//  BezierPath
//
//  Created by Pronin Alexander on 07.05.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RITBezierPathView.h"

@interface RITViewController : UIViewController

@property (strong, nonatomic) RITBezierPathView *canvas;

- (IBAction)actionButton:(UIButton *)sender;
- (IBAction)actionTransform:(UIButton *)sender;
- (IBAction)actionScale:(UIButton *)sender;

@end
