//
//  ResultsViewController.h
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UITableViewController

@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL delegateMethod;

- (id)initWithResults:(NSArray*)results;

@end
