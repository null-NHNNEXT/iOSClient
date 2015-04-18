//
//  NullModelDelegate.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NullModelDelegate <NSObject>

- (void)didReceivePosts:(NSArray *)posts;
- (void)fetchingPostsFailedWithError:(NSError *)error;

@end
