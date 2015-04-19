//
//  MasterViewController.m
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController () <NullModelDelegate>

@property (weak, nonatomic) NullModel * model;
@property NSMutableArray * objects;
@property NSArray * posts;
@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.model = [NullModel sharedInstance];
	self.model.delegate = self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;

	UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blackboard.png"]];
	[self.tableView setBackgroundView:imageView];

	NSLog(@"MasterViewController:viewDidLoad -> register notification(NullModelDidReceivedPosts)");
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePosts:) name:@"NullModelDidReceivedPosts" object:nil];
	NSLog(@"MasterViewController:viewDidLoad -> post notification(NullModelWillStartFetchingPosts)");
	[[NSNotificationCenter defaultCenter] postNotificationName:@"NullModelWillStartFetchingPosts" object:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
	if (!self.objects) {
	    self.objects = [[NSMutableArray alloc] init];
	}
	[self.objects insertObject:[NSDate date] atIndex:0];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updatePosts:(NSNotification *)notification {
	[self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:false];
}

#pragma mark - NullModelDelegate

- (void)didReceivePosts:(NSArray *)posts {
	self.posts = posts;
}

- (void)fetchingPostsFailedWithError:(NSError *)error {
	NSLog(@"Error: %@; %@", error, [error localizedDescription]);
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    [[segue destinationViewController] setDetailItem:object];
	}
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	NSDate *object = self.objects[indexPath.row];
	cell.textLabel.text = [object description];
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}

@end
