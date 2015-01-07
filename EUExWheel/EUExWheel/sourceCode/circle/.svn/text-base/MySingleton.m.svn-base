//
//  MySingleton.m
//  RouletteMenuDemo
//
//  Created by zhijian du on 14-3-13.
//  Copyright (c) 2014年 demo. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton
@synthesize rect = _rect;
@synthesize y=_y;

static MySingleton *_sharedMysingleton;

+(MySingleton *)sharedMySingleton
{
    if (!_sharedMysingleton) {
        _sharedMysingleton = [[MySingleton alloc]init];
    }
    return _sharedMysingleton;
}

@end
