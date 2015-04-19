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
			sharedInstance.restApi.delegate = sharedInstance;
			NSLog(@"NullModel created");
		}
	}
	
	return sharedInstance;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.restApi = [[NullRestApi alloc] init];
		NSLog(@"NullModel:init -> register notification(NullModelWillStartFetchingPosts)");
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchPosts:) name:@"NullModelWillStartFetchingPosts" object:nil];
		NSLog(@"NullModel:init -> register notification(NullModelWillStartFetchingComments)");
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchComments:) name:@"NullModelWillStartFetchingComments" object:nil];
	}
	return self;
}

- (void)fetchPosts:(NSNotification *)notification {
	NSLog(@"NullModel:fetchPosts -> NullRestApi:fetchPostsFromGroup");
	[self.restApi fetchPostsFromGroup:@"TestGroup"];
}

- (void)fetchComments:(NSNotification *)notification {
	NSLog(@"NullModel:fetchComments -> NullRestApi:fetchCommentsFromPost");
	[self.restApi fetchCommentsFromPost:@"TestPost"];
}

- (void)addPost:(Post *)post {
	// TODO
}

- (void)modifyPost:(Post *)post {
	// TODO
}

- (void)deletePost:(Post *)post {
	// TODO
}

- (void)selectPost:(Post *)post {
	// TODO
}

- (void)addComment:(Comment *)comment withPost:(Post *)post {
	// TODO
}

- (void)deleteComment:(Comment *)comment {
	// TODO
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

	// Test Code
	NSLog(@"NullModel:receivedPostsJSON -> MasterViewController:didReceivePosts");
	[self.delegate didReceivePosts:nil];

	NSLog(@"NullModel:receivedPostsJSON -> post notification(NullModelDidReceivedPosts)");
	[[NSNotificationCenter defaultCenter] postNotificationName:@"NullModelDidReceivedPosts" object:nil];
}

- (void)receivedCommentsJSON:(NSData *)objectNotation {
	//
}

- (void)fetchingPostsFailedWithError:(NSError *)error {
	if (self.delegate) {
		[self.delegate fetchingPostsFailedWithError:error];
	}
}

- (void)fetchingCommentsFailedWithError:(NSError *)error {
	if (self.detailDelegate) {
		[self.detailDelegate fetchingCommentsFailedWithError:error];
	}
}

@end
