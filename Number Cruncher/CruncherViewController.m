//
//  CruncherViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "CruncherViewController.h"
#import "MathExpressionGenerator.h"

@interface CruncherViewController ()

@property (nonatomic, strong) MathExpressionGenerator* generator;
@property (nonatomic, strong) UILabel* expressionLabel;
@property (nonatomic, strong) UITextField* inputField;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, assign) NSInteger ellapsedMilliseconds;

@end

@implementation CruncherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.generator = [[MathExpressionGenerator alloc] init];
		self.ellapsedMilliseconds = 0;
		
		self.title = @"Number Cruncher";
		self.view.backgroundColor = [UIColor whiteColor];
		
		self.expressionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 80)];
		self.expressionLabel.text = @"1 + 2 + 3 + 4 + 5 + 6";
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
		UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(onDonePressed:)];
		toolbar.items = @[flexibleSpace, doneButton, flexibleSpace];
		[toolbar sizeToFit];
		[self.inputField setInputAccessoryView:toolbar];
		
		self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 20)];
		
		UIButton* startButton = [UIButton buttonWithType:UIButtonTypeSystem];
		[startButton setTitle:@"Go!" forState:UIControlStateNormal];
		startButton.titleLabel.font = [UIFont systemFontOfSize:32];
		[startButton addTarget:self action:@selector(onStartPressed:) forControlEvents:UIControlEventTouchUpInside];
		[startButton sizeToFit];
		NSLog(@"Start button size: %@", NSStringFromCGRect(startButton.bounds));
		startButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - CGRectGetMidX(startButton.bounds), 100, startButton.bounds.size.width, startButton.bounds.size.height);
		NSLog(@"Start button frame: %@", NSStringFromCGRect(startButton.frame));
		
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
	//[self.inputField resignFirstResponder];
	self.expressionLabel.attributedText = [self.generator generateSimpleExp10].formattedString;
	self.ellapsedMilliseconds = 0;
	self.inputField.text = nil;
}

- (void)updateTimer:(NSTimer*)timer {
	self.ellapsedMilliseconds++;
	self.timeLabel.text = [NSString stringWithFormat:@"%.2f", (self.ellapsedMilliseconds / 100.0)];
}

- (void)onStartPressed:(UIButton*)button {
	[button removeFromSuperview];
	NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 / 100.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
	[timer fire];
	[self.view addSubview:self.expressionLabel];
	[self.inputField becomeFirstResponder];
}

@end
