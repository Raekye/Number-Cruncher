//
//  StatisticsViewController.m
//  Number Cruncher
//
//  Created by Adrian on 2/23/2014.
//  Copyright (c) 2014 Creatif Cubed. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
		self.title = @"Statistics";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self refreshData];

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
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
	}
    
    // Configure the cell...
	cell.textLabel.text = @[@"Accuracy - Week", @"Time - Week", @"Accuracy - Month", @"Time - Month", @"Accuracy - Forever", @"Time - Forever", @"Numbers Crunched"][indexPath.row];
	cell.detailTextLabel.text = @"";
	NSFetchRequest* fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"ComputationResult"];
	if (indexPath.section > 0) {
		NSString* type = @[@"algebraic", @"polynomial", @"exponential", @"logarithm"][indexPath.section - 1];
		[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"expression_type == %@", type]];
	}
	NSError* error = nil;
	NSArray* results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
	if (error) {
		NSLog(@"Error: %@, %@", error, error.userInfo);
		return cell; // TODO: handle;
	}
	if (indexPath.row == 6) {
		cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", results.count];
	}
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @[@"Overall", @"Algebraic", @"Polynomial", @"Exponential", @"Logarithmic"][section];
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

#pragma mark - Private
- (void)refreshData {
	[self.tableView reloadData];
}

@end
