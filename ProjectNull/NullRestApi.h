//
//  NullRestApi.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NullRestApiDelegate;

@interface NullRestApi : NSObject
@property (weak, nonatomic) id<NullRestApiDelegate> delegate;

- (void)fetchPostsFromGroup:(NSString *)groupId;

@end
