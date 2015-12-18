//
//  Choice.m
//  Wherever
//
//  Created by mac on 12/17/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "Activity.h"

@implementation Activity
- (id) init {
    static dispatch_once_t dispatch_Once;
    dispatch_once (&dispatch_Once, ^ {
        _name = @"";
        _imageName = @"";
    });
    if (self = [super init]) {
        _name = @"";
        _imageName = @"";
    }
    return self;
}
@end
