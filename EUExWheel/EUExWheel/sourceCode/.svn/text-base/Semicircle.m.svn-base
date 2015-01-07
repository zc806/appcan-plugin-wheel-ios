//
//  Semicircle.m
//  EUExRouletteMenu
//
//  Created by RAY on 14-8-31.
//  Copyright (c) 2014年 RAY. All rights reserved.
//

#import "Semicircle.h"
#import "EUtility.h"

@implementation Semicircle

-(void)dealloc {
    [_uexObj release];
    [super dealloc];
}

-(id)initWithuexObj:(EUExBase *)uexObj andRect:(CGRect)rect {
    if (self=[super init]) {
        self.uexObj=uexObj;
        self.x=rect.origin.x;
        self.y=rect.origin.y;
        self.w=rect.size.width;
        self.h=rect.size.height;
    }
    return self;
}

-(void)open{
    CGRect rect =  [UIScreen mainScreen].bounds;
    if (!_view) {
        _view = [[MyView alloc]initWithFrame:CGRectMake(0, _y, rect.size.width , _h)];
        _view.delegate =self;
        [EUtility brwView:self.uexObj.meBrwView addSubview:_view];
    } else {
        _view.hidden =NO;
    }
    _view.jsData = self.jsData;
    _view.uexObj = self.uexObj;
    [_view wind];
}

-(void)close{
    [UIView animateWithDuration:0.5 animations:^{
        [_view close];
    } completion:^(BOOL finished) {
        _view.hidden = YES;
    }];
}

-(void)sendBack:(NSString *)str {
    int i = [str intValue];
    [self.uexObj jsSuccessWithName:@"uexWheel.cbSelect" opId:i dataType:UEX_CALLBACK_DATATYPE_TEXT strData:str];
}

@end
