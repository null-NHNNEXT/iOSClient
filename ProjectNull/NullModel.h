//
//  NullModel.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NullModelDelegate.h"
#import "NullModelDetailDelegate.h"
#import "NullRestApiDelegate.h"
#import "Post.h"
#import "Comment.h"

@class NullRestApi;

@interface NullModel : NSObject<NullRestApiDelegate>

@property (strong, nonatomic) NullRestApi * restApi;
@property (weak, nonatomic) id<NullModelDelegate> delegate;
@property (weak, nonatomic) id<NullModelDetailDelegate> detailDelegate;

+ (id)sharedInstance;

- (void)addPost:(Post *)post;
- (void)modifyPost:(Post *)post;
- (void)deletePost:(Post *)post;

- (void)selectPost:(Post *)post;

- (void)addComment:(Comment *)comment withPost:(Post *)post;
- (void)deleteComment:(Comment *)comment;

@end
