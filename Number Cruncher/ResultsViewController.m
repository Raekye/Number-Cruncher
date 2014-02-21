//
//  ResultsViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"Results";
		self.view.backgroundColor = [UIColor whiteColor];
		
		UIBarButtonItem* done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneClicked:)];
		self.navigationItem.leftBarButtonItems = @[done];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Handlers
- (void)onDoneClicked:(UIBarButtonItem*)button {
	[self dismissViewControllerAnimated:YES completion:^{
		IMP imp = [self.delegate methodForSelector:self.delegateMethod];
		void (*func)(id, SEL) = (void*) imp;
		func(self.delegate, self.delegateMethod);
	}];
}

@end
