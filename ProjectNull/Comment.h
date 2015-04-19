//
//  Comment.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 19..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (strong, nonatomic) NSString * commentId;
@property (strong, nonatomic) NSString * writer;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * contents;

@end
