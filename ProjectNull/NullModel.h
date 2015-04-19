//
//  NullModel.h
//  ProjectNull
//
//  Created by JinWoo Lee on 2015. 4. 18..
//  Copyright (c) 2015년 JinWoo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NullModelDelegate.h"
#import "NullRestApiDelegate.h"

@class NullRestApi;

@interface NullModel : NSObject<NullRestApiDelegate>

@property (strong, nonatomic) NullRestApi * restApi;
@property (weak, nonatomic) id<NullModelDelegate> delegate;

+ (id)sharedInstance;

@end
