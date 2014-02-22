//
//  ResultsViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/21/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "ResultsViewController.h"
#import "ComputationResult.h"

@interface ResultsViewController ()

@property (nonatomic, strong) NSArray* results;

@end

@implementation ResultsViewController

- (id)initWithResults:(NSArray *)results {
	self.results = results;
	return [self initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		self.title = @"Results";
		
		UIBarButtonItem* done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneClicked:)];
		self.navigationItem.leftBarButtonItems = @[done];
		
		[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
		case 0:
			return 2;
		case 1:
			return self.results.count;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			double total = 0;
			for (ComputationResult* each in self.results) {
				total += each.duration;
			}
			cell.textLabel.text = [NSString stringWithFormat:@"Total time: %.2fs", total];
		} else if (indexPath.row == 1) {
			double total = 0;
			for (ComputationResult* each in self.results) {
				total += each.accuracy;
			}
			cell.textLabel.text = [NSString stringWithFormat:@"Average accuracy: %d%%", (NSInteger) round(total * 100 / self.results.count)];
		}
	} else if (indexPath.section == 1) {
		ComputationResult* result = self.results[indexPath.row];
		NSMutableAttributedString* str = [result.expression.formattedString mutableCopy];
		[str appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" - %d%% - %.2fs", (NSInteger) round(result.accuracy * 100), result.duration]]];
		cell.textLabel.attributedText = str;
	}
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @[@"Overall", @"Individual"][section];
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

#pragma mark - Handlers
- (void)onDoneClicked:(UIBarButtonItem*)button {
	[self dismissViewControllerAnimated:YES completion:^{
		IMP imp = [self.delegate methodForSelector:self.delegateMethod];
		void (*func)(id, SEL) = (void*) imp;
		func(self.delegate, self.delegateMethod);
	}];
}

@end
