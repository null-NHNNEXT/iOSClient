//
//  DetailViewController.m
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <NullModelDetailDelegate>

@property NSArray * comments;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
	    self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - NullModelDetailDelegate

- (void)didReceiveComments:(NSArray *)comments {
	self.comments = comments;
}

- (void)fetchingCommentsFailedWithError:(NSError *)error {
	NSLog(@"Error: %@; %@", error, [error localizedDescription]);
}

@end
