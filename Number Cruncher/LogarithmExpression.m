//
//  LogarithmExpression.m
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "LogarithmExpression.h"
#import <CoreText/CoreText.h>

@interface LogarithmExpression ()

@property (nonatomic, strong) NSNumber* base;
@property (nonatomic, strong) NSNumber* x;

@end

@implementation LogarithmExpression

- (id)initWithBase:(NSNumber *)base x:(NSNumber *)x {
	self = [super init];
	if (self) {
		self.base = base;
		self.x = x;
	}
	return self;
}

- (NSNumber *)realValue {
	return [NSNumber numberWithDouble: log10(self.x.doubleValue)];
}

- (BOOL) isNaturalLog {
	return NO;
}

- (NSAttributedString *)formattedString {
	if (self.isNaturalLog) {
		return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"ln(%g)", self.x.doubleValue]];
	}
	NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:@"log"];
	[str appendAttributedString:[[NSAttributedString alloc] initWithString:self.base.stringValue attributes:@{(__bridge NSString*) kCTSuperscriptAttributeName: @"-1", NSFontAttributeName: [UIFont systemFontOfSize:8.0]}]];
	[str appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"(%g)", self.x.doubleValue]]];
	return [str copy];
}

- (NSString*)expressionType {
	return @"logarithm";
}

@end
