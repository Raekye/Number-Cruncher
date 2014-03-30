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
#import "SettingsData.h"
#import "StatisticsViewController.h"
#import "BackgroundView.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton* startButton;
@property (nonatomic, strong) UIButton* settingsButton;
@property (nonatomic, strong) UIButton* statisticsButton;
@property (nonatomic, strong) UIButton* aboutButton;
@property (nonatomic, strong) UIView * backgroundView;

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
		self.startButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 165 / 2, CGRectGetMidY(self.view.bounds) - 100, 165, 40);
      self.startButton.layer.cornerRadius = 10;
      self.startButton.backgroundColor = [UIColor colorWithRed: 0.497 green: 0.689 blue: 0.893 alpha: 1];
		[self.startButton setTitle:@"Start" forState:UIControlStateNormal];
		self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25];
      [self.startButton setTitleColor:[UIColor whiteColor]
                                forState:UIControlStateNormal];
      
		self.settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[self.settingsButton addTarget:self action:@selector(onSettingsClicked:) forControlEvents:UIControlEventTouchUpInside];
		self.settingsButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 165 / 2, CGRectGetMidY(self.view.bounds) - 40, 165, 40);
      self.settingsButton.layer.cornerRadius = 10;
      self.settingsButton.backgroundColor = [UIColor colorWithRed: 0.497 green: 0.689 blue: 0.893 alpha: 1];
		[self.settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
		self.settingsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25];
      [self.settingsButton setTitleColor:[UIColor whiteColor]
                             forState:UIControlStateNormal];
      
		self.statisticsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[self.statisticsButton addTarget:self action:@selector(onStatisticsClicked:) forControlEvents:UIControlEventTouchUpInside];
		self.statisticsButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 165 / 2, CGRectGetMidY(self.view.bounds) + 20, 165, 40);
		[self.statisticsButton setTitle:@"Statistics" forState:UIControlStateNormal];
      self.statisticsButton.layer.cornerRadius = 10;
      self.statisticsButton.backgroundColor = [UIColor colorWithRed: 0.497 green: 0.689 blue: 0.893 alpha: 1];
		self.statisticsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25];
      [self.statisticsButton setTitleColor:[UIColor whiteColor]
                                  forState:UIControlStateNormal];
		
		self.aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[self.aboutButton addTarget:self action:@selector(onAboutClicked:) forControlEvents:UIControlEventTouchUpInside];
		self.aboutButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 165 / 2, CGRectGetMidY(self.view.bounds) + 80, 165, 40);
      self.aboutButton.layer.cornerRadius = 10;
      self.aboutButton.backgroundColor = [UIColor colorWithRed: 0.497 green: 0.689 blue: 0.893 alpha: 1];
		[self.aboutButton setTitle:@"About" forState:UIControlStateNormal];
		self.aboutButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25];
      [self.aboutButton setTitleColor:[UIColor whiteColor]
                             forState:UIControlStateNormal];

      CGRect screenRect = [[UIScreen mainScreen] bounds];
      CGFloat screenWidth = screenRect.size.width;
      CGFloat screenHeight = screenRect.size.height;
    self.backgroundView = [[BackgroundView alloc] init];
      self.backgroundView.frame = CGRectMake(screenWidth-74, screenHeight-98, 64, 88);
    [self.view addSubview:self.backgroundView];
      
		[self.view addSubview:self.startButton];
		[self.view addSubview:self.settingsButton];
		[self.view addSubview:self.statisticsButton];
		[self.view addSubview:self.aboutButton];
      
      [self.view setBackgroundColor:[UIColor colorWithRed: 0.16 green: 0.367 blue: 0.573 alpha: 1]];
      
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

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ComputationResult" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
		// Replace this implementation with code to handle the error appropriately.
		// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}



#pragma mark - Handlers
- (void)onStartClicked:(UIButton*)button {
	CruncherViewController* cruncher = [[CruncherViewController alloc] initWithNumberOfExpressions:[SettingsData instance].numberOfExpressions];
	cruncher.managedObjectContext = self.managedObjectContext;
	[self.navigationController pushViewController:cruncher animated:YES];
}

- (void)onSettingsClicked:(UIButton*)button {
	SettingsViewController* settings = [[SettingsViewController alloc] init];
	[self.navigationController pushViewController:settings animated:YES];
}

- (void)onStatisticsClicked:(UIButton*)button {
	StatisticsViewController* statistics = [[StatisticsViewController alloc] init];
	statistics.managedObjectContext = self.managedObjectContext;
	[self.navigationController pushViewController:statistics animated:YES];
}
		 
- (void)onAboutClicked:(UIButton*)button {
	
}

@end
