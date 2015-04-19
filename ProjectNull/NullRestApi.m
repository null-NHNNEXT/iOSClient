//
//  NullRestApi.m
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import "NullRestApi.h"
#import "NullRestApiDelegate.h"

@implementation NullRestApi

- (void)fetchPostsFromGroup:(NSString *)groupId {
//	NSString * urlString = @"http://localhost:3000/test/viewall";
//	NSURL * url = [[NSURL alloc] initWithString:urlString];
//	// TODO: http://www.appcoda.com/fetch-parse-json-ios-progrmming-tutorial/
//	
//	[NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//		if (connectionError) {
//			[self.delegate fetchingPostsFailedWithError:connectionError];
//		} else {
//			[self.delegate receivedPostsJSON:[DummyDataForTest dummyPostsJSON]];
//			//			[self.delegate receivedPostsJSON:data];
//		}
//	}];

	// Test Code
	NSLog(@"NullRestApi:fetchPostsFromGroup -> NullModel:receivedPostsJSON");
	[self.delegate receivedPostsJSON:nil];
}

@end
