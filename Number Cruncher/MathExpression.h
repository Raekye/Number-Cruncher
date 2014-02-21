//
//  MathExpression.h
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathExpression : NSObject

@property (nonatomic, readonly) NSAttributedString* formattedString;
@property (nonatomic, readonly) NSNumber* realValue;

@end
