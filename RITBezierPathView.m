//
//  RITBezierPathView.m
//  BezierPath
//
//  Created by Pronin Alexander on 07.05.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITBezierPathView.h"

@interface RITBezierPathView ()

@end

@implementation RITBezierPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (id)initWithFrame:(CGRect)frame andPaths:(NSArray*) pathsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _pathsArray = pathsArray;
        _selectedPathIndex = - 1;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
 
    // draw unselected paths
    [[UIColor blackColor] setStroke];
    NSInteger i = 0;
    for (UIBezierPath *path in self.pathsArray) {
        
        if (!(i == _selectedPathIndex)) {
            
            [path stroke];
        }
        i++;
        
        //NSLog(@"Bounds: %@", NSStringFromCGRect(path.bounds));
    }
    
    //[[self randomColor] setFill];
    //[self.path fill];
    //[self.path fillWithBlendMode:kCGBlendModeNormal alpha:0.2f];
}

#pragma mark - Methods

- (void) setSelectedPathIndex:(NSInteger)selectedPathIndex {
    
    //NSLog(@"Subviews: %@", self.subviews);
    
    // remove previous view if needed
    if ([self.subviews count] > 0) {
        
        [self.subviews[0] removeFromSuperview];
    }
    
    _selectedPathIndex = selectedPathIndex;
    
    // draw selected path
    UIBezierPath *path = self.pathsArray[selectedPathIndex];
    UIGraphicsBeginImageContext(self.frame.size);
    
    // add shadow
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextSetShadowWithColor(context, CGSizeMake(10, 10), 12.f, [UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    
    UIImageView *pathView = [[UIImageView alloc] initWithFrame:self.bounds];
    pathView.backgroundColor = [UIColor clearColor];
    
    pathView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self addSubview:pathView];
}

- (UIBezierPath*) touchInsidePath:(CGPoint) point {
    
    UIBezierPath *result = nil;
    
    for (UIBezierPath *path in self.pathsArray) {
        
        if ([path containsPoint:point]) {
            
            result = path;
            break;
        }
    }
    return result;
}

- (UIColor*) randomColor {
    
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
