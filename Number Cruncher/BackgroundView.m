//
//  BackgroundView.m
//  Number Cruncher
//
//  Created by Simon Chiu on 2014-03-30.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      [self setBackgroundColor:[UIColor colorWithRed: 0.16 green: 0.367 blue: 0.573 alpha: 1]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  //// Color Declarations
  UIColor* firstColor = [UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1];
  UIColor* secondColor = [UIColor colorWithRed: 0.5 green: 0.5 blue: 0.5 alpha: 1];
  UIColor* thirdColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
  
  //// Group
  {
    //// cogOne Drawing
    UIBezierPath* cogOnePath = [UIBezierPath bezierPath];
    [cogOnePath moveToPoint: CGPointMake(17.04, 0)];
    [cogOnePath addLineToPoint: CGPointMake(16.72, 3.12)];
    [cogOnePath addLineToPoint: CGPointMake(16.32, 6.24)];
    [cogOnePath addLineToPoint: CGPointMake(14.72, 6.96)];
    [cogOnePath addLineToPoint: CGPointMake(13.12, 7.68)];
    [cogOnePath addLineToPoint: CGPointMake(10.56, 5.6)];
    [cogOnePath addLineToPoint: CGPointMake(8.08, 3.6)];
    [cogOnePath addLineToPoint: CGPointMake(5.92, 5.76)];
    [cogOnePath addLineToPoint: CGPointMake(3.76, 7.92)];
    [cogOnePath addLineToPoint: CGPointMake(5.76, 10.4)];
    [cogOnePath addLineToPoint: CGPointMake(7.76, 12.96)];
    [cogOnePath addLineToPoint: CGPointMake(7.04, 14.48)];
    [cogOnePath addLineToPoint: CGPointMake(6.32, 16)];
    [cogOnePath addLineToPoint: CGPointMake(3.52, 16.4)];
    [cogOnePath addCurveToPoint: CGPointMake(0.32, 16.88) controlPoint1: CGPointMake(1.92, 16.64) controlPoint2: CGPointMake(0.56, 16.8)];
    [cogOnePath addCurveToPoint: CGPointMake(0, 20) controlPoint1: CGPointMake(0.08, 16.96) controlPoint2: CGPointMake(0, 17.84)];
    [cogOnePath addLineToPoint: CGPointMake(0, 22.96)];
    [cogOnePath addLineToPoint: CGPointMake(3.12, 23.28)];
    [cogOnePath addCurveToPoint: CGPointMake(6.32, 23.92) controlPoint1: CGPointMake(5.04, 23.52) controlPoint2: CGPointMake(6.32, 23.76)];
    [cogOnePath addCurveToPoint: CGPointMake(6.96, 25.6) controlPoint1: CGPointMake(6.32, 24.08) controlPoint2: CGPointMake(6.56, 24.88)];
    [cogOnePath addLineToPoint: CGPointMake(7.6, 27.04)];
    [cogOnePath addLineToPoint: CGPointMake(5.6, 29.44)];
    [cogOnePath addLineToPoint: CGPointMake(3.6, 31.92)];
    [cogOnePath addLineToPoint: CGPointMake(5.76, 34.08)];
    [cogOnePath addLineToPoint: CGPointMake(7.92, 36.24)];
    [cogOnePath addLineToPoint: CGPointMake(10.32, 34.4)];
    [cogOnePath addLineToPoint: CGPointMake(12.72, 32.48)];
    [cogOnePath addLineToPoint: CGPointMake(14.16, 33.2)];
    [cogOnePath addCurveToPoint: CGPointMake(15.92, 34) controlPoint1: CGPointMake(14.96, 33.6) controlPoint2: CGPointMake(15.76, 34)];
    [cogOnePath addCurveToPoint: CGPointMake(16.48, 36.72) controlPoint1: CGPointMake(16, 34.08) controlPoint2: CGPointMake(16.24, 35.28)];
    [cogOnePath addCurveToPoint: CGPointMake(16.88, 39.68) controlPoint1: CGPointMake(16.64, 38.16) controlPoint2: CGPointMake(16.8, 39.44)];
    [cogOnePath addCurveToPoint: CGPointMake(19.92, 40) controlPoint1: CGPointMake(16.96, 39.92) controlPoint2: CGPointMake(17.76, 40)];
    [cogOnePath addLineToPoint: CGPointMake(22.96, 40)];
    [cogOnePath addLineToPoint: CGPointMake(23.28, 37.12)];
    [cogOnePath addCurveToPoint: CGPointMake(24.08, 34.08) controlPoint1: CGPointMake(23.52, 34.88) controlPoint2: CGPointMake(23.68, 34.16)];
    [cogOnePath addCurveToPoint: CGPointMake(25.92, 33.28) controlPoint1: CGPointMake(24.32, 34) controlPoint2: CGPointMake(25.12, 33.68)];
    [cogOnePath addLineToPoint: CGPointMake(27.28, 32.64)];
    [cogOnePath addLineToPoint: CGPointMake(29.6, 34.56)];
    [cogOnePath addLineToPoint: CGPointMake(32, 36.4)];
    [cogOnePath addLineToPoint: CGPointMake(34.08, 34.24)];
    [cogOnePath addCurveToPoint: CGPointMake(36, 31.76) controlPoint1: CGPointMake(35.68, 32.64) controlPoint2: CGPointMake(36.16, 32)];
    [cogOnePath addCurveToPoint: CGPointMake(34.16, 29.44) controlPoint1: CGPointMake(35.84, 31.52) controlPoint2: CGPointMake(34.96, 30.48)];
    [cogOnePath addLineToPoint: CGPointMake(32.56, 27.44)];
    [cogOnePath addLineToPoint: CGPointMake(33.28, 26)];
    [cogOnePath addCurveToPoint: CGPointMake(33.92, 24.24) controlPoint1: CGPointMake(33.68, 25.2) controlPoint2: CGPointMake(33.92, 24.4)];
    [cogOnePath addCurveToPoint: CGPointMake(38.08, 23.36) controlPoint1: CGPointMake(33.92, 23.92) controlPoint2: CGPointMake(34.56, 23.76)];
    [cogOnePath addLineToPoint: CGPointMake(39.84, 23.12)];
    [cogOnePath addLineToPoint: CGPointMake(39.92, 20.08)];
    [cogOnePath addLineToPoint: CGPointMake(40, 17.04)];
    [cogOnePath addLineToPoint: CGPointMake(36.96, 16.72)];
    [cogOnePath addCurveToPoint: CGPointMake(33.92, 16.08) controlPoint1: CGPointMake(35.12, 16.48) controlPoint2: CGPointMake(33.92, 16.24)];
    [cogOnePath addCurveToPoint: CGPointMake(33.28, 14.32) controlPoint1: CGPointMake(33.92, 15.92) controlPoint2: CGPointMake(33.68, 15.12)];
    [cogOnePath addLineToPoint: CGPointMake(32.56, 12.8)];
    [cogOnePath addLineToPoint: CGPointMake(34.48, 10.48)];
    [cogOnePath addLineToPoint: CGPointMake(36.4, 8.08)];
    [cogOnePath addLineToPoint: CGPointMake(34.24, 5.92)];
    [cogOnePath addLineToPoint: CGPointMake(32.08, 3.76)];
    [cogOnePath addLineToPoint: CGPointMake(29.68, 5.68)];
    [cogOnePath addLineToPoint: CGPointMake(27.28, 7.6)];
    [cogOnePath addLineToPoint: CGPointMake(25.6, 6.88)];
    [cogOnePath addLineToPoint: CGPointMake(23.92, 6.16)];
    [cogOnePath addLineToPoint: CGPointMake(23.52, 3.2)];
    [cogOnePath addLineToPoint: CGPointMake(23.12, 0.16)];
    [cogOnePath addLineToPoint: CGPointMake(20.08, 0.08)];
    [cogOnePath addLineToPoint: CGPointMake(17.04, 0)];
    [cogOnePath closePath];
    [cogOnePath moveToPoint: CGPointMake(20, 13.6)];
    [cogOnePath addCurveToPoint: CGPointMake(26.4, 20) controlPoint1: CGPointMake(23.52, 13.6) controlPoint2: CGPointMake(26.4, 16.48)];
    [cogOnePath addCurveToPoint: CGPointMake(20, 26.4) controlPoint1: CGPointMake(26.4, 23.52) controlPoint2: CGPointMake(23.52, 26.4)];
    [cogOnePath addCurveToPoint: CGPointMake(13.6, 20) controlPoint1: CGPointMake(16.48, 26.4) controlPoint2: CGPointMake(13.6, 23.52)];
    [cogOnePath addCurveToPoint: CGPointMake(20, 13.6) controlPoint1: CGPointMake(13.6, 16.48) controlPoint2: CGPointMake(16.48, 13.6)];
    [cogOnePath closePath];
    cogOnePath.miterLimit = 4;
    
    [thirdColor setFill];
    [cogOnePath fill];
    
    
    //// cogTwo Drawing
    UIBezierPath* cogTwoPath = [UIBezierPath bezierPath];
    [cogTwoPath moveToPoint: CGPointMake(48.92, 24.39)];
    [cogTwoPath addLineToPoint: CGPointMake(47.43, 27.15)];
    [cogTwoPath addLineToPoint: CGPointMake(45.87, 29.88)];
    [cogTwoPath addLineToPoint: CGPointMake(44.11, 29.93)];
    [cogTwoPath addLineToPoint: CGPointMake(42.36, 29.98)];
    [cogTwoPath addLineToPoint: CGPointMake(40.79, 27.08)];
    [cogTwoPath addLineToPoint: CGPointMake(39.26, 24.29)];
    [cogTwoPath addLineToPoint: CGPointMake(36.44, 25.46)];
    [cogTwoPath addLineToPoint: CGPointMake(33.62, 26.62)];
    [cogTwoPath addLineToPoint: CGPointMake(34.52, 29.68)];
    [cogTwoPath addLineToPoint: CGPointMake(35.39, 32.81)];
    [cogTwoPath addLineToPoint: CGPointMake(34.14, 33.94)];
    [cogTwoPath addLineToPoint: CGPointMake(32.89, 35.07)];
    [cogTwoPath addLineToPoint: CGPointMake(30.15, 34.37)];
    [cogTwoPath addCurveToPoint: CGPointMake(27.01, 33.59) controlPoint1: CGPointMake(28.58, 33.98) controlPoint2: CGPointMake(27.26, 33.6)];
    [cogTwoPath addCurveToPoint: CGPointMake(25.52, 36.35) controlPoint1: CGPointMake(26.76, 33.57) controlPoint2: CGPointMake(26.35, 34.35)];
    [cogTwoPath addLineToPoint: CGPointMake(24.39, 39.08)];
    [cogTwoPath addLineToPoint: CGPointMake(27.15, 40.57)];
    [cogTwoPath addCurveToPoint: CGPointMake(29.86, 42.39) controlPoint1: CGPointMake(28.83, 41.53) controlPoint2: CGPointMake(29.92, 42.24)];
    [cogTwoPath addCurveToPoint: CGPointMake(29.81, 44.18) controlPoint1: CGPointMake(29.8, 42.53) controlPoint2: CGPointMake(29.72, 43.37)];
    [cogTwoPath addLineToPoint: CGPointMake(29.85, 45.76)];
    [cogTwoPath addLineToPoint: CGPointMake(27.08, 47.21)];
    [cogTwoPath addLineToPoint: CGPointMake(24.29, 48.74)];
    [cogTwoPath addLineToPoint: CGPointMake(25.46, 51.56)];
    [cogTwoPath addLineToPoint: CGPointMake(26.62, 54.38)];
    [cogTwoPath addLineToPoint: CGPointMake(29.55, 53.6)];
    [cogTwoPath addLineToPoint: CGPointMake(32.5, 52.74)];
    [cogTwoPath addLineToPoint: CGPointMake(33.55, 53.96)];
    [cogTwoPath addCurveToPoint: CGPointMake(34.87, 55.37) controlPoint1: CGPointMake(34.14, 54.64) controlPoint2: CGPointMake(34.73, 55.31)];
    [cogTwoPath addCurveToPoint: CGPointMake(34.35, 58.1) controlPoint1: CGPointMake(34.92, 55.48) controlPoint2: CGPointMake(34.68, 56.68)];
    [cogTwoPath addCurveToPoint: CGPointMake(33.59, 60.99) controlPoint1: CGPointMake(33.95, 59.49) controlPoint2: CGPointMake(33.6, 60.74)];
    [cogTwoPath addCurveToPoint: CGPointMake(36.27, 62.45) controlPoint1: CGPointMake(33.57, 61.24) controlPoint2: CGPointMake(34.28, 61.62)];
    [cogTwoPath addLineToPoint: CGPointMake(39.08, 63.61)];
    [cogTwoPath addLineToPoint: CGPointMake(40.48, 61.07)];
    [cogTwoPath addCurveToPoint: CGPointMake(42.38, 58.57) controlPoint1: CGPointMake(41.56, 59.09) controlPoint2: CGPointMake(41.98, 58.49)];
    [cogTwoPath addCurveToPoint: CGPointMake(44.39, 58.53) controlPoint1: CGPointMake(42.63, 58.59) controlPoint2: CGPointMake(43.5, 58.6)];
    [cogTwoPath addLineToPoint: CGPointMake(45.89, 58.46)];
    [cogTwoPath addLineToPoint: CGPointMake(47.3, 61.13)];
    [cogTwoPath addLineToPoint: CGPointMake(48.81, 63.74)];
    [cogTwoPath addLineToPoint: CGPointMake(51.56, 62.54)];
    [cogTwoPath addCurveToPoint: CGPointMake(54.28, 60.99) controlPoint1: CGPointMake(53.65, 61.68) controlPoint2: CGPointMake(54.34, 61.27)];
    [cogTwoPath addCurveToPoint: CGPointMake(53.47, 58.14) controlPoint1: CGPointMake(54.23, 60.7) controlPoint2: CGPointMake(53.81, 59.41)];
    [cogTwoPath addLineToPoint: CGPointMake(52.76, 55.68)];
    [cogTwoPath addLineToPoint: CGPointMake(53.97, 54.63)];
    [cogTwoPath addCurveToPoint: CGPointMake(55.24, 53.24) controlPoint1: CGPointMake(54.65, 54.04) controlPoint2: CGPointMake(55.18, 53.39)];
    [cogTwoPath addCurveToPoint: CGPointMake(59.42, 54.02) controlPoint1: CGPointMake(55.36, 52.95) controlPoint2: CGPointMake(56.01, 53.05)];
    [cogTwoPath addLineToPoint: CGPointMake(61.14, 54.47)];
    [cogTwoPath addLineToPoint: CGPointMake(62.37, 51.7)];
    [cogTwoPath addLineToPoint: CGPointMake(63.61, 48.92)];
    [cogTwoPath addLineToPoint: CGPointMake(60.92, 47.46)];
    [cogTwoPath addCurveToPoint: CGPointMake(58.36, 45.71) controlPoint1: CGPointMake(59.32, 46.53) controlPoint2: CGPointMake(58.3, 45.85)];
    [cogTwoPath addCurveToPoint: CGPointMake(58.44, 43.83) controlPoint1: CGPointMake(58.42, 45.56) controlPoint2: CGPointMake(58.51, 44.73)];
    [cogTwoPath addLineToPoint: CGPointMake(58.36, 42.15)];
    [cogTwoPath addLineToPoint: CGPointMake(61.02, 40.75)];
    [cogTwoPath addLineToPoint: CGPointMake(63.71, 39.26)];
    [cogTwoPath addLineToPoint: CGPointMake(62.54, 36.44)];
    [cogTwoPath addLineToPoint: CGPointMake(61.38, 33.62)];
    [cogTwoPath addLineToPoint: CGPointMake(58.42, 34.47)];
    [cogTwoPath addLineToPoint: CGPointMake(55.47, 35.33)];
    [cogTwoPath addLineToPoint: CGPointMake(54.19, 34.02)];
    [cogTwoPath addLineToPoint: CGPointMake(52.92, 32.71)];
    [cogTwoPath addLineToPoint: CGPointMake(53.68, 29.83)];
    [cogTwoPath addLineToPoint: CGPointMake(54.47, 26.86)];
    [cogTwoPath addLineToPoint: CGPointMake(51.7, 25.63)];
    [cogTwoPath addLineToPoint: CGPointMake(48.92, 24.39)];
    [cogTwoPath closePath];
    [cogTwoPath moveToPoint: CGPointMake(46.45, 38.09)];
    [cogTwoPath addCurveToPoint: CGPointMake(49.91, 46.45) controlPoint1: CGPointMake(49.7, 39.43) controlPoint2: CGPointMake(51.26, 43.2)];
    [cogTwoPath addCurveToPoint: CGPointMake(41.55, 49.91) controlPoint1: CGPointMake(48.57, 49.7) controlPoint2: CGPointMake(44.8, 51.26)];
    [cogTwoPath addCurveToPoint: CGPointMake(38.09, 41.55) controlPoint1: CGPointMake(38.3, 48.57) controlPoint2: CGPointMake(36.74, 44.8)];
    [cogTwoPath addCurveToPoint: CGPointMake(46.45, 38.09) controlPoint1: CGPointMake(39.43, 38.3) controlPoint2: CGPointMake(43.2, 36.74)];
    [cogTwoPath closePath];
    cogTwoPath.miterLimit = 4;
    
    [firstColor setFill];
    [cogTwoPath fill];
    
    
    //// cogThree Drawing
    UIBezierPath* cogThreePath = [UIBezierPath bezierPath];
    [cogThreePath moveToPoint: CGPointMake(17.04, 48)];
    [cogThreePath addLineToPoint: CGPointMake(16.72, 51.12)];
    [cogThreePath addLineToPoint: CGPointMake(16.32, 54.24)];
    [cogThreePath addLineToPoint: CGPointMake(14.72, 54.96)];
    [cogThreePath addLineToPoint: CGPointMake(13.12, 55.68)];
    [cogThreePath addLineToPoint: CGPointMake(10.56, 53.6)];
    [cogThreePath addLineToPoint: CGPointMake(8.08, 51.6)];
    [cogThreePath addLineToPoint: CGPointMake(5.92, 53.76)];
    [cogThreePath addLineToPoint: CGPointMake(3.76, 55.92)];
    [cogThreePath addLineToPoint: CGPointMake(5.76, 58.4)];
    [cogThreePath addLineToPoint: CGPointMake(7.76, 60.96)];
    [cogThreePath addLineToPoint: CGPointMake(7.04, 62.48)];
    [cogThreePath addLineToPoint: CGPointMake(6.32, 64)];
    [cogThreePath addLineToPoint: CGPointMake(3.52, 64.4)];
    [cogThreePath addCurveToPoint: CGPointMake(0.32, 64.88) controlPoint1: CGPointMake(1.92, 64.64) controlPoint2: CGPointMake(0.56, 64.8)];
    [cogThreePath addCurveToPoint: CGPointMake(0, 68) controlPoint1: CGPointMake(0.08, 64.96) controlPoint2: CGPointMake(0, 65.84)];
    [cogThreePath addLineToPoint: CGPointMake(0, 70.96)];
    [cogThreePath addLineToPoint: CGPointMake(3.12, 71.28)];
    [cogThreePath addCurveToPoint: CGPointMake(6.32, 71.92) controlPoint1: CGPointMake(5.04, 71.52) controlPoint2: CGPointMake(6.32, 71.76)];
    [cogThreePath addCurveToPoint: CGPointMake(6.96, 73.6) controlPoint1: CGPointMake(6.32, 72.08) controlPoint2: CGPointMake(6.56, 72.88)];
    [cogThreePath addLineToPoint: CGPointMake(7.6, 75.04)];
    [cogThreePath addLineToPoint: CGPointMake(5.6, 77.44)];
    [cogThreePath addLineToPoint: CGPointMake(3.6, 79.92)];
    [cogThreePath addLineToPoint: CGPointMake(5.76, 82.08)];
    [cogThreePath addLineToPoint: CGPointMake(7.92, 84.24)];
    [cogThreePath addLineToPoint: CGPointMake(10.32, 82.4)];
    [cogThreePath addLineToPoint: CGPointMake(12.72, 80.48)];
    [cogThreePath addLineToPoint: CGPointMake(14.16, 81.2)];
    [cogThreePath addCurveToPoint: CGPointMake(15.92, 82) controlPoint1: CGPointMake(14.96, 81.6) controlPoint2: CGPointMake(15.76, 82)];
    [cogThreePath addCurveToPoint: CGPointMake(16.48, 84.72) controlPoint1: CGPointMake(16, 82.08) controlPoint2: CGPointMake(16.24, 83.28)];
    [cogThreePath addCurveToPoint: CGPointMake(16.88, 87.68) controlPoint1: CGPointMake(16.64, 86.16) controlPoint2: CGPointMake(16.8, 87.44)];
    [cogThreePath addCurveToPoint: CGPointMake(19.92, 88) controlPoint1: CGPointMake(16.96, 87.92) controlPoint2: CGPointMake(17.76, 88)];
    [cogThreePath addLineToPoint: CGPointMake(22.96, 88)];
    [cogThreePath addLineToPoint: CGPointMake(23.28, 85.12)];
    [cogThreePath addCurveToPoint: CGPointMake(24.08, 82.08) controlPoint1: CGPointMake(23.52, 82.88) controlPoint2: CGPointMake(23.68, 82.16)];
    [cogThreePath addCurveToPoint: CGPointMake(25.92, 81.28) controlPoint1: CGPointMake(24.32, 82) controlPoint2: CGPointMake(25.12, 81.68)];
    [cogThreePath addLineToPoint: CGPointMake(27.28, 80.64)];
    [cogThreePath addLineToPoint: CGPointMake(29.6, 82.56)];
    [cogThreePath addLineToPoint: CGPointMake(32, 84.4)];
    [cogThreePath addLineToPoint: CGPointMake(34.08, 82.24)];
    [cogThreePath addCurveToPoint: CGPointMake(36, 79.76) controlPoint1: CGPointMake(35.68, 80.64) controlPoint2: CGPointMake(36.16, 80)];
    [cogThreePath addCurveToPoint: CGPointMake(34.16, 77.44) controlPoint1: CGPointMake(35.84, 79.52) controlPoint2: CGPointMake(34.96, 78.48)];
    [cogThreePath addLineToPoint: CGPointMake(32.56, 75.44)];
    [cogThreePath addLineToPoint: CGPointMake(33.28, 74)];
    [cogThreePath addCurveToPoint: CGPointMake(33.92, 72.24) controlPoint1: CGPointMake(33.68, 73.2) controlPoint2: CGPointMake(33.92, 72.4)];
    [cogThreePath addCurveToPoint: CGPointMake(38.08, 71.36) controlPoint1: CGPointMake(33.92, 71.92) controlPoint2: CGPointMake(34.56, 71.76)];
    [cogThreePath addLineToPoint: CGPointMake(39.84, 71.12)];
    [cogThreePath addLineToPoint: CGPointMake(39.92, 68.08)];
    [cogThreePath addLineToPoint: CGPointMake(40, 65.04)];
    [cogThreePath addLineToPoint: CGPointMake(36.96, 64.72)];
    [cogThreePath addCurveToPoint: CGPointMake(33.92, 64.08) controlPoint1: CGPointMake(35.12, 64.48) controlPoint2: CGPointMake(33.92, 64.24)];
    [cogThreePath addCurveToPoint: CGPointMake(33.28, 62.32) controlPoint1: CGPointMake(33.92, 63.92) controlPoint2: CGPointMake(33.68, 63.12)];
    [cogThreePath addLineToPoint: CGPointMake(32.56, 60.8)];
    [cogThreePath addLineToPoint: CGPointMake(34.48, 58.48)];
    [cogThreePath addLineToPoint: CGPointMake(36.4, 56.08)];
    [cogThreePath addLineToPoint: CGPointMake(34.24, 53.92)];
    [cogThreePath addLineToPoint: CGPointMake(32.08, 51.76)];
    [cogThreePath addLineToPoint: CGPointMake(29.68, 53.68)];
    [cogThreePath addLineToPoint: CGPointMake(27.28, 55.6)];
    [cogThreePath addLineToPoint: CGPointMake(25.6, 54.88)];
    [cogThreePath addLineToPoint: CGPointMake(23.92, 54.16)];
    [cogThreePath addLineToPoint: CGPointMake(23.52, 51.2)];
    [cogThreePath addLineToPoint: CGPointMake(23.12, 48.16)];
    [cogThreePath addLineToPoint: CGPointMake(20.08, 48.08)];
    [cogThreePath addLineToPoint: CGPointMake(17.04, 48)];
    [cogThreePath closePath];
    [cogThreePath moveToPoint: CGPointMake(20, 61.6)];
    [cogThreePath addCurveToPoint: CGPointMake(26.4, 68) controlPoint1: CGPointMake(23.52, 61.6) controlPoint2: CGPointMake(26.4, 64.48)];
    [cogThreePath addCurveToPoint: CGPointMake(20, 74.4) controlPoint1: CGPointMake(26.4, 71.52) controlPoint2: CGPointMake(23.52, 74.4)];
    [cogThreePath addCurveToPoint: CGPointMake(13.6, 68) controlPoint1: CGPointMake(16.48, 74.4) controlPoint2: CGPointMake(13.6, 71.52)];
    [cogThreePath addCurveToPoint: CGPointMake(20, 61.6) controlPoint1: CGPointMake(13.6, 64.48) controlPoint2: CGPointMake(16.48, 61.6)];
    [cogThreePath closePath];
    cogThreePath.miterLimit = 4;
    
    [secondColor setFill];
    [cogThreePath fill];
  }

}


@end
