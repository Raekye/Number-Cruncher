//
//  MainViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "MainViewController.h"
#import "SettingsViewController.h"
#import "CruncherViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton* startButton;
@property (nonatomic, strong) UIButton* settingsButton;

@end

@implementation MainViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
		self.title = @"Number Cruncher";
		
		self.startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[self.startButton addTarget:self action:@selector(onStartClicked:) forControlEvents:UIControlEventTouchUpInside];
		self.startButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 120 / 2, CGRectGetMidY(self.view.bounds) - 50, 120, 40);
		[self.startButton setTitle:@"Start" forState:UIControlStateNormal];
		self.startButton.titleLabel.font = [UIFont systemFontOfSize:32];
		
		self.settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[self.settingsButton addTarget:self action:@selector(onSettingsClicked:) forControlEvents:UIControlEventTouchUpInside];
		self.settingsButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 120 / 2, CGRectGetMidY(self.view.bounds) + 10, 120, 40);
		[self.settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
		self.settingsButton.titleLabel.font = [UIFont systemFontOfSize:32];
		
		[self.view addSubview:self.startButton];
		[self.view addSubview:self.settingsButton];
	
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
- (void)onStartClicked:(UIButton*)button {
	CruncherViewController* cruncher = [[CruncherViewController alloc] initWithNumberOfExpressions:10];
	[self.navigationController pushViewController:cruncher animated:YES];
}

- (void)onSettingsClicked:(UIButton*)button {
	SettingsViewController* settings = [[SettingsViewController alloc] init];
	[self.navigationController pushViewController:settings animated:YES];
}

@end
