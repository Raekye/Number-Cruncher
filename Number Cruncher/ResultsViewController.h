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
@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

- (id)initWithResults:(NSArray*)results managedObjectContext:(NSManagedObjectContext*)managedObjectContext;

@end
