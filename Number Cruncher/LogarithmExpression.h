//
//  LogarithmExpression.h
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "MathExpression.h"

@interface LogarithmExpression : MathExpression

@property (nonatomic, readonly) NSNumber* base;
@property (nonatomic, readonly) NSNumber* x;

- (id)initWithBase:(NSNumber*)base x:(NSNumber*)x;

@end
