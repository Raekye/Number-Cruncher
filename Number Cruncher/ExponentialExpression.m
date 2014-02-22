//
//  ExponentialExpression.m
//  Number Cruncher
//
//  Created by Adrian on 2/12/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "ExponentialExpression.h"
#import <CoreText/CoreText.h>

@interface ExponentialExpression ()

@property (nonatomic, strong) NSNumber* base;
@property (nonatomic, strong) NSNumber* x;

@end

@implementation ExponentialExpression

- (id)initWithBase:(NSNumber *)base x:(NSNumber *)x {
	self = [super init];
	if (self) {
		self.base = base;
		self.x = x;
	}
	return self;
}

- (NSNumber *)realValue {
	return [NSNumber numberWithDouble:pow(self.base.doubleValue, self.x.doubleValue)];
}

- (BOOL) isBaseE {
	return NO;
}

- (NSAttributedString *)formattedString {
	NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:self.isBaseE ? @"e" : self.base.stringValue];
	[str appendAttributedString:[[NSAttributedString alloc] initWithString:self.x.stringValue attributes:@{(__bridge NSString*) kCTSuperscriptAttributeName: @"1", NSFontAttributeName: [UIFont systemFontOfSize:10.0]}]];
	return [str copy];
}

@end
