//
//  CruncherViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "CruncherViewController.h"
#import "MathExpressionGenerator.h"
#import "ComputationResult.h"
#import "MathExpression.h"
#import "ResultsViewController.h"

@interface CruncherViewController ()

@property (nonatomic, strong) MathExpressionGenerator* generator;
@property (nonatomic, strong) UILabel* expressionLabel;
@property (nonatomic, strong) UITextField* inputField;
@property (nonatomic, strong) UIBarButtonItem* doneButton;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, assign) NSInteger ellapsedMilliseconds;
@property (nonatomic, assign) NSInteger numberOfCompletedExpressions;
@property (nonatomic, strong) NSMutableArray* results;
@property (nonatomic, strong) MathExpression* currentExpression;
@property (nonatomic, strong) NSTimer* timer;

@end

@implementation CruncherViewController

- (id)initWithNumberOfExpressions:(NSInteger)num
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
		self.generator = [[MathExpressionGenerator alloc] init];
		self.ellapsedMilliseconds = 0;
		self.numberOfExpressions = num;
		self.results = [NSMutableArray arrayWithCapacity:self.numberOfExpressions];
		self.currentExpression = [self.generator generateSimpleExp10];
		self.numberOfCompletedExpressions = 0;
		self.timer = nil; // TODO: hmmm
		
		self.title = @"Number Cruncher";
		self.view.backgroundColor = [UIColor whiteColor];
		
		self.expressionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 80)];
		self.expressionLabel.font = [UIFont systemFontOfSize:64];
		self.expressionLabel.textAlignment = NSTextAlignmentCenter;
		self.expressionLabel.adjustsFontSizeToFitWidth = YES;
		self.expressionLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
		
		self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(10, 170, self.view.bounds.size.width - 20, 40)];
		self.inputField.font = [UIFont systemFontOfSize:32];
		self.inputField.keyboardType = UIKeyboardTypeDecimalPad;
		self.inputField.textAlignment = NSTextAlignmentCenter;
		self.inputField.borderStyle = UITextBorderStyleRoundedRect;
		self.inputField.adjustsFontSizeToFitWidth = YES;
		
		UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
		UIBarButtonItem* flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(onDonePressed:)];
		self.doneButton.enabled = NO;
		toolbar.items = @[flexibleSpace, self.doneButton, flexibleSpace];
		[toolbar sizeToFit];
		[self.inputField setInputAccessoryView:toolbar];
		
		self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 20)];
		
		UIButton* startButton = [UIButton buttonWithType:UIButtonTypeSystem];
		[startButton setTitle:@"Go!" forState:UIControlStateNormal];
		startButton.titleLabel.font = [UIFont systemFontOfSize:32];
		[startButton addTarget:self action:@selector(onStartPressed:) forControlEvents:UIControlEventTouchUpInside];
		[startButton sizeToFit];
		startButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - CGRectGetMidX(startButton.bounds), 100, startButton.bounds.size.width, startButton.bounds.size.height);
		
//		[self.view addSubview:self.expressionLabel];
		[self.view addSubview:startButton];
		[self.view addSubview:self.inputField];
		[self.view addSubview:self.timeLabel];
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

- (void)onDonePressed:(UIBarButtonItem*)button {
	ComputationResult* result = [[ComputationResult alloc] initWithExpression:self.currentExpression input:self.inputField.text.doubleValue duration:self.ellapsedMilliseconds / 100.0];
	[self.results addObject:result];
	self.numberOfCompletedExpressions++;
	if (self.numberOfCompletedExpressions == self.numberOfExpressions) {
		[self.timer invalidate];
		ResultsViewController* resultsViewController = [[ResultsViewController alloc] initWithResults:[self.results copy]];
		resultsViewController.delegate = self;
		resultsViewController.delegateMethod = @selector(onResultsDismissed);
		UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:resultsViewController];
		[self presentViewController:nav animated:YES completion:nil];
	} else {
		self.currentExpression = [self.generator generateSimpleExp10];
		self.expressionLabel.attributedText = self.currentExpression.formattedString;
	}
	self.ellapsedMilliseconds = 0;
	self.inputField.text = nil;
}

- (void)updateTimer:(NSTimer*)timer {
	self.ellapsedMilliseconds++;
	self.timeLabel.text = [NSString stringWithFormat:@"%.2f", (self.ellapsedMilliseconds / 100.0)];
}

- (void)onStartPressed:(UIButton*)button {
	[button removeFromSuperview];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1 / 100.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
	[self.timer fire];
	[self.view addSubview:self.expressionLabel];
	self.expressionLabel.attributedText = self.currentExpression.formattedString;
	[self.inputField becomeFirstResponder];
	self.doneButton.enabled = YES;
}

- (void)onResultsDismissed {
	[self.navigationController popViewControllerAnimated:YES];
}

@end
