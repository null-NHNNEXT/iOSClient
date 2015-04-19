//
//  NullRestApiDelegate.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NullRestApiDelegate <NSObject>

- (void)receivedPostsJSON:(NSData *)objectNotation;
- (void)receivedCommentsJSON:(NSData *)objectNotation;
- (void)fetchingPostsFailedWithError:(NSError *)error;
- (void)fetchingCommentsFailedWithError:(NSError *)error;

@end
