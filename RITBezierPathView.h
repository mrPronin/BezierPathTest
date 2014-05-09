//
//  RITBezierPathView.h
//  BezierPath
//
//  Created by Pronin Alexander on 07.05.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RITBezierPathView : UIView

//@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) NSArray *pathsArray;
@property (assign, nonatomic) NSInteger selectedPathIndex;

- (id)initWithFrame:(CGRect)frame andPaths:(NSArray*) pathsArray;
- (UIBezierPath*) touchInsidePath:(CGPoint) point;

@end
