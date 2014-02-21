//
//  ComputationResult.h
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathExpression.h"

@interface ComputationResult : NSObject

- (id)initWithExpression:(MathExpression*)expression input:(double)input duration:(double)duration;

@property (nonatomic, readonly) MathExpression* expression;
@property (nonatomic, readonly) double duration;
@property (nonatomic, readonly) double input;

- (double)accuracy;

@end
