//
//  SettingsData.h
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsData : NSObject

+ (SettingsData*)instance;

- (BOOL)isExpressionTypeEnabled:(NSString*)type;
- (void)setExpressionType:(NSString*)type enabled:(BOOL)enabled;
- (void)toggleExpressionTypeEnabled:(NSString*)type;

@end
