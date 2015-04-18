//
//  NullModel.m
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import "NullModel.h"
#import "NullRestApi.h"

@implementation NullModel

+ (id)sharedInstance {
	static NullModel * sharedInstance = nil;
	
	@synchronized(self) {
		if (sharedInstance == nil) {
			sharedInstance = [[self alloc] init];
			sharedInstance.restApi = [[NullRestApi alloc] init];
			sharedInstance.restApi.delegate = sharedInstance;
		}
		NSLog(@"NullModel created");
	}
	
	return sharedInstance;
}

- (void)fetchPosts {
	NSLog(@"NullModel -> NullRestApi fetchPostsFromGroup");
	[self.restApi fetchPostsFromGroup:@"TestGroup"];
}

#pragma mark - NullRestApiDelegate

- (void)receivedPostsJSON:(NSData *)objectNotation {
//	NSError * error = nil;
//	NSArray * posts = [PostBuilder postsFromJSON:objectNotation error:&error];
//	
//	if (error) {
//		[self.delegate fetchingPostsFailedWithError:error];
//	} else {
//		[self.delegate didReceivePosts:posts];
//	}
}

- (void)fetchingPostsFailedWithError:(NSError *)error {
	[self.delegate fetchingPostsFailedWithError:error];
}

@end
