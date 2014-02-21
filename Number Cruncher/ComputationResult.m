//
//  ComputationResult.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "ComputationResult.h"

@interface ComputationResult ()

@property (nonatomic, strong) MathExpression* expression;
@property (nonatomic, assign) double time;
@property (nonatomic, assign) double input;
@property (nonatomic, assign) double duration;

@end

@implementation ComputationResult

- (id)initWithExpression:(MathExpression *)expression input:(double)input duration:(double)duration {
	self = [super init];
	if (self) {
		self.expression = expression;
		self.input = input;
		self.duration = duration;
	}
	return self;
}

- (double)accuracy {
	double realValue = self.expression.realValue.doubleValue;
	return fabs((realValue - self.input) / realValue);
}

@end
