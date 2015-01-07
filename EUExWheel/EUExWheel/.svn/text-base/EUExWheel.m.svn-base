//
//  EUExWheel.m
//  EUExWheel
//
//  Created by xurigan on 14-10-18.
//  Copyright (c) 2014年 com.zywx. All rights reserved.
//

#import "EUExWheel.h"
#import "Circle.h"
#import "Quartercircle.h"
#import "Semicircle.h"

@interface EUExWheel()

@property(nonatomic,retain)Circle *circle;
@property(nonatomic,retain)Quartercircle *quartercircle;
@property(nonatomic,retain)Semicircle *semicircle;

@end

@implementation EUExWheel

-(id)initWithBrwView:(EBrowserView *)eInBrwView{
    if (self=[super initWithBrwView:eInBrwView]) {
        //
    }
    return self;
}

-(void)clean {
    if (_quartercircle) {
        [_quartercircle close];
        [_quartercircle release];
    }
    if (_semicircle) {
        [_semicircle close];
        [_semicircle release];
    }
    if (_circle) {
        [_circle close];
        [_circle release];
    }
}

-(void)dealloc{
    [super dealloc];
}

-(void)openCircle:(NSMutableArray*)inArguments {
    float x = [[inArguments objectAtIndex:0] floatValue];
    float y = [[inArguments objectAtIndex:1] floatValue];
    float width = [[inArguments objectAtIndex:2] floatValue];
    float height = [[inArguments objectAtIndex:3] floatValue];
    NSString * jsStr = [inArguments objectAtIndex:4];
    int flag = [[inArguments objectAtIndex:5] intValue];
    CGRect rect=CGRectMake(x, y, width, height);
    self.circle=[[Circle alloc]initWithuexObj:self andRect:rect];
    self.circle.jsData = jsStr;
    self.circle.flag = flag;
    [self.circle open];
}

-(void)closeCircle:(NSMutableArray*)inArguments {
    if (self.circle) {
        [_circle close];
    }
}

-(void)openSemicircle:(NSMutableArray*)inArguments {
    float x = [[inArguments objectAtIndex:0] floatValue];
    float y = [[inArguments objectAtIndex:1] floatValue];
    float width = [[inArguments objectAtIndex:2] floatValue];
    float height = [[inArguments objectAtIndex:3] floatValue];
    NSString * jsStr = [inArguments objectAtIndex:4];
    CGRect rect=CGRectMake(x, y, width, height);
    self.semicircle=[[Semicircle alloc]initWithuexObj:self andRect:rect];
    self.semicircle.jsData = jsStr;
    [self.semicircle open];
}

-(void)closeSemicircle:(NSMutableArray*)inArguments {
    if (self.semicircle) {
        [_semicircle close];
    }
}

-(void)openQuartercircle:(NSMutableArray*)inArguments {
    float x = [[inArguments objectAtIndex:0] floatValue];
    float y = [[inArguments objectAtIndex:1] floatValue];
    float width = [[inArguments objectAtIndex:2] floatValue];
    float height = [[inArguments objectAtIndex:3] floatValue];
    NSString * jsStr = [inArguments objectAtIndex:4];
    CGRect rect=CGRectMake(x, y, width, height);
    self.quartercircle=[[Quartercircle alloc]initWithuexObj:self andRect:rect];
    self.quartercircle.jsData = jsStr;
    [self.quartercircle open];
}

-(void)closeQuartercircle:(NSMutableArray*)inArguments {
    if (self.quartercircle) {
        [_quartercircle close];
    }
}



@end
