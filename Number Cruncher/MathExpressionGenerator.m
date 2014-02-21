//
//  MathExpressionGenerator.m
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "MathExpressionGenerator.h"

@implementation MathExpressionGenerator

- (MathExpression*)generateSimpleLog10 {
	uint32_t r = arc4random() % 8 + 1;
	return [[LogarithmExpression alloc] initWithBase:@10 x:[NSNumber numberWithDouble:(double) r]];
}

- (MathExpression *)generateSimpleExp10 {
	uint32_t r = arc4random() % 8 + 1;
	return [[ExponentialExpression alloc] initWithBase:@10 x:[NSNumber numberWithDouble:(double) r / 10]];
}

@end
