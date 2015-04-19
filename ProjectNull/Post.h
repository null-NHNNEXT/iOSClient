//
//  Post.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 19..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (strong, nonatomic) NSString * postId;
@property (strong, nonatomic) NSString * writer;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * contents;

@end
