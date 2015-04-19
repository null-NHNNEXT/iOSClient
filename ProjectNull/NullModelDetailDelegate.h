//
//  NullModelDetailDelegate.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 20..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NullModelDetailDelegate <NSObject>

- (void)didReceiveComments:(NSArray *)comments;
- (void)fetchingCommentsFailedWithError:(NSError *)error;

@end
