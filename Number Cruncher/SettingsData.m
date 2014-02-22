//
//  SettingsData.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "SettingsData.h"

@interface SettingsData ()

@property (nonatomic, strong) NSUserDefaults* userSettings;

@end

@implementation SettingsData
static SettingsData* singleton = nil;

+ (SettingsData*)instance {
	return singleton;
}

+ (void)initialize {
	static BOOL initialized = NO;
	if (!initialized) {
		initialized = YES;
		singleton = [[SettingsData alloc] init];
	}
}

- (id)init {
	self = [super init];
	if (self) {
		self.userSettings = [NSUserDefaults standardUserDefaults];
	}
	return self;
}

- (BOOL)isExpressionTypeEnabled:(NSString *)type {
	return [self.userSettings boolForKey:[NSString stringWithFormat:@"expression_type-%@", type]];
}

- (void)setExpressionType:(NSString *)type enabled:(BOOL)enabled {
	[self.userSettings setBool:enabled forKey:[NSString stringWithFormat:@"expression_type-%@", type]];
}

- (void)toggleExpressionTypeEnabled:(NSString *)type {
	[self setExpressionType:type enabled:![self isExpressionTypeEnabled:type]];
}

- (void)setNumberOfExpressions:(NSInteger)num {
	[self.userSettings setInteger:num forKey:@"number_of_expressions"];
}

- (NSInteger)numberOfExpressions {
	NSInteger num = [self.userSettings integerForKey:@"number_of_expressions"];
	return MIN(MAX(num, 10), 50);
}

@end
