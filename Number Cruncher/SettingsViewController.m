//
//  SettingsViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsData.h"

@interface SettingsViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UITextField* numberOfExpressionsField;
@property (nonatomic, assign) BOOL numberOfExpressionsIsShowing;

@end

@implementation SettingsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
		self.title = @"Settings";
		//[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
		self.numberOfExpressionsField = [[UITextField alloc] init];
		self.numberOfExpressionsField.keyboardType = UIKeyboardTypeNumberPad;
		self.numberOfExpressionsIsShowing = NO;
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2; // general, enabled expressions
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	return [@[@1, @4][section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
	}
    
    // Configure the cell...
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			cell.textLabel.text = @"Number of expresssions";
			cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [SettingsData instance].numberOfExpressions];
			self.numberOfExpressionsField.textAlignment = NSTextAlignmentRight;
			self.numberOfExpressionsField.adjustsFontSizeToFitWidth = YES;
			UIBarButtonItem* done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onNumberOfExpressionsDonePressed:)];
			UIToolbar* toolbar = [[UIToolbar alloc] init];
			UIBarButtonItem* flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
			toolbar.items = @[flexibleSpace, done];
			[toolbar sizeToFit];
			self.numberOfExpressionsField.inputAccessoryView = toolbar;
		}
	} else if (indexPath.section == 1) {
		cell.textLabel.text = @[@"Algebraic", @"Polynomials", @"Powers", @"Logarithms"][indexPath.row];
		cell.accessoryType = [[SettingsData instance] isExpressionTypeEnabled:[SettingsViewController expressionTypeTagForRow:indexPath.row]] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	}
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @[@"General", @"Enabled Expressions"][section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
			if (self.numberOfExpressionsIsShowing) {
				[self onNumberOfExpressionsDonePressed:nil];
			} else {
				self.numberOfExpressionsField.text = cell.detailTextLabel.text;
				cell.detailTextLabel.hidden = YES;
				NSInteger textFieldWidth = cell.contentView.bounds.size.width - cell.textLabel.bounds.size.width - 15 * 3;
				self.numberOfExpressionsField.frame = CGRectMake(15 * 2 + cell.textLabel.bounds.size.width, cell.textLabel.frame.origin.y, textFieldWidth, cell.textLabel.bounds.size.height);
				[cell.contentView addSubview:self.numberOfExpressionsField];
//				cell.accessoryView = self.numberOfExpressionsField;
				[self.numberOfExpressionsField becomeFirstResponder];
				self.numberOfExpressionsIsShowing = YES;
			}
		}
	} else if (indexPath.section == 1) {
		[[SettingsData instance] toggleExpressionTypeEnabled:[SettingsViewController expressionTypeTagForRow:indexPath.row]];
		[tableView reloadData];
		[tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 50 - 10 + 1;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [NSString stringWithFormat:@"%d", row + 10];
}

#pragma mark - Handlers
- (void)onNumberOfExpressionsDonePressed:(UIBarButtonItem*)button {
	[self.numberOfExpressionsField resignFirstResponder];
	[self.numberOfExpressionsField removeFromSuperview];
	//cell.accessoryView = nil;
	[[SettingsData instance] setNumberOfExpressions:self.numberOfExpressionsField.text.integerValue];
	UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	cell.detailTextLabel.hidden = NO;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [SettingsData instance].numberOfExpressions];
	self.numberOfExpressionsIsShowing = NO;
}

#pragma mark - Private

+ (NSString*)expressionTypeTagForRow:(NSInteger)row {
	return @[@"algebraic", @"polynomial", @"powers", @"logarithms"][row];
}

@end
