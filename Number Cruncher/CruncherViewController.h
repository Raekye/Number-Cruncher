//
//  CruncherViewController.h
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CruncherViewController : UIViewController

- (id) initWithNumberOfExpressions:(NSInteger)num;
@property (nonatomic, assign) NSInteger numberOfExpressions;

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

@end
