//
//  MathExpressionGenerator.h
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathExpression.h"
#import "LogarithmExpression.h"
#import "ExponentialExpression.h"

@interface MathExpressionGenerator : NSObject

- (MathExpression*) generateSimpleLog10;
- (MathExpression*) generateSimpleExp10;

@end
