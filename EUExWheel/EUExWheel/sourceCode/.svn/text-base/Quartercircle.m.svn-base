//
//  Quartercircle.m
//  EUExWheel
//
//  Created by RAY on 14-8-30.
//  Copyright (c) 2014年 RAY. All rights reserved.
//

#import "Quartercircle.h"

#import "EUtility.h"
#import "EUExBaseDefine.h"
#import "JCArcButtonWheelView.h"
#import <math.h>
#import "MyButton.h"
#import "MyButton2.h"
#import "SBJSON.h"

@implementation Quartercircle

-(void)dealloc{
    [_uexObj release];
    [_rootView release];
    [_buttons release];
    [_myBtn release];
    [_titleArray release];
    [_imgs release];
    [_myView release];
    [_myView1 release];
    [_view release];
    //
    [super dealloc];
}

-(id)initWithuexObj:(EUExBase*)uexObj andRect:(CGRect)rect{
    self=[super init];
    if (self) {
        self.uexObj=uexObj;
        self.x=rect.origin.x;
        self.y=rect.origin.y;
        self.w=rect.size.width;
        self.h=rect.size.height;
        self.openTitle=[[NSString alloc]init];
        self.openImg=[[NSString alloc]init];
        self.closeImg=[[NSString alloc]init];
        self.closeTitle=[[NSString alloc]init];
        self.titleArray = [NSMutableArray array];
        self.imgs = [NSMutableArray array];
    }
    return self;
}

-(void)open{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    for(UIView *view in window.subviews)
    {
        if (view.tag == 110) {
            _myView = view;
        }
    }
    //*****json******
//    NSString *jsonFilePath = [[NSBundle mainBundle]pathForResource:@"uexWheel/resource_quarter" ofType:@"txt"];
//    NSData *jsonData=[[NSData alloc]initWithContentsOfFile:jsonFilePath];
//    NSString *jsonStr=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    SBJsonParser* jsonParser=[[SBJsonParser alloc]init];
    NSMutableDictionary * jsonDic=[jsonParser objectWithString:self.jsData];
    NSMutableArray * dataArray = [jsonDic objectForKey:@"data"];
    for (NSMutableDictionary * tempDic in dataArray) {
        [self.titleArray addObject:[tempDic objectForKey:@"title"]];
        [self.imgs addObject:[tempDic objectForKey:@"image"]];
    }
    _openImg=[[jsonDic objectForKey:@"openImg"] retain];
    _openTitle=[[jsonDic objectForKey:@"openTitle"] retain];
    _closeImg=[[jsonDic objectForKey:@"closeImg"] retain];
    _closeTitle=[[jsonDic objectForKey:@"closeTitle"] retain];
    _rootBG=[[jsonDic objectForKey:@"subBg"] retain];
    _subBg=[[jsonDic objectForKey:@"rootBg"] retain];
    //*****json******
    
    [self initView];
    _myView.hidden = NO;
    _view.hidden = NO;
    if (_isOpen) {
        
        [UIView animateWithDuration:0 animations:^{
            
            CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI*0.5);//逆时针为负数，正则是顺时针
            CGRect frame = _rootView.controlView.frame;
            _rootView.controlView.layer.anchorPoint =CGPointMake(1,1);//设置旋转的中心点（锚点）
            _rootView.controlView.frame = frame;//设置anchorPont会使view的frame改变。重新赋值。
            //一个2秒的动画，实现旋转。
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration:0];
            _rootView.controlView.transform = transform;
            [UIView commitAnimations];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                _myView.frame= CGRectMake(_w-70+_x, _h-70+_y, 70, 70);
                _myView1.frame= CGRectMake(0, 0, 70, 70);
                
                _myBtn.frame = CGRectMake(0, 0, 70, 70);
                _myView1.backgroundColor = [UIColor clearColor];
                //                _rootView.frame = CGRectMake(320, 568, 0, 0);
                
            } completion:^(BOOL finished) {
            }];
            
        }];
        
        [_myBtn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_openImg]] forState:UIControlStateNormal];
        [_myBtn setTitle:_openTitle forState:UIControlStateNormal];
        _isOpen = NO;
        
        
    }

}

-(void)close{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    for(UIView *view in window.subviews)
    {
        if (view.tag == 110) {
            view.hidden = YES;
        }
    }
    _myView.hidden = YES;
    _view.hidden = YES;
}

-(UIImage *)getImageFromLocalFile:(NSString*)imageName{
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
}
-(void)logRect:(CGRect)r msg:(NSString*)str {
    NSLog(@"%@: %4.1f,%4.1f sz: %4.1f,%4.1f",str,r.origin.x,r.origin.y,r.size.width,r.size.height);
}
-(void)buttonPressed:(id)btn {
    MyButton *b = (MyButton*)btn;
    [self openClick];
    NSString *jSonStr = [NSString stringWithFormat:@"%d", b.tag];
    int i = (int)b.tag;
    
    [self.uexObj jsSuccessWithName:@"uexWheel.cbSelect" opId:i dataType:UEX_CALLBACK_DATATYPE_TEXT strData:jSonStr];
}
-(MyButton *)makeButton:(NSString *)imageName tag:(NSInteger)tag {
    MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
    UIImage *im = [UIImage imageWithContentsOfFile:imageName];
    btn.titleLabel.font = [UIFont  systemFontOfSize:13];
    
    [btn setImage:im forState:UIControlStateNormal];
    [btn setShowsTouchWhenHighlighted:TRUE];
    [btn setTag:tag];
    CGRect r = CGRectMake(0,0, im.size.width, im.size.height);
    btn.frame=r;
    
    //    [btn addTarget:self action:@selector(btnDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[_titleArray objectAtIndex:btn.tag] forState:UIControlStateNormal];

    
    return btn;
}


-(void)openClick
{
    
    if (_isOpen) {
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI*0.5);//逆时针为负数，正则是顺时针
            CGRect frame = _rootView.controlView.frame;
            _rootView.controlView.layer.anchorPoint =CGPointMake(1,1);//设置旋转的中心点（锚点）
            _rootView.controlView.frame = frame;//设置anchorPont会使view的frame改变。重新赋值。
            //一个2秒的动画，实现旋转。
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration:0.5f];
            _rootView.controlView.transform = transform;
            [UIView commitAnimations];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                _myView.frame= CGRectMake(_w-70+_x, _h-70+_y, 70, 70);
                _myView1.frame= CGRectMake(0, 0, 70, 70);
                _myBtn.frame = CGRectMake(0, 0, 70, 70);
                _myView1.backgroundColor = [UIColor clearColor];
                //                _rootView.frame = CGRectMake(320, 568, 0, 0);
                
            } completion:^(BOOL finished) {
            }];
            
        }];
        
        [_myBtn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_openImg]] forState:UIControlStateNormal];
        [_myBtn setTitle:_openTitle forState:UIControlStateNormal];
        _isOpen = NO;
        
    }
    
    else
    {
        _myView.frame= CGRectMake(_x, _y, _w, _h);
        _myView1.frame= CGRectMake(0, 0, _w, _h);
        
        _myView1.backgroundColor =[UIColor blackColor];
        _myView1.alpha =0.2;
        _myBtn.frame = CGRectMake(_w-70, _h-70, 70, 70);
        
        //        _rootView.frame = CGRectMake(0, 0, 320, 568);
        
        [UIView animateWithDuration:0.5 animations:^{
            _rootView.controlView.transform = CGAffineTransformIdentity;//还原
            [_myBtn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_closeImg]] forState:UIControlStateNormal];
            [_myBtn setTitle:_closeTitle forState:UIControlStateNormal];
            _isOpen = YES;
        }];
        
    }
    
    
    [_myView bringSubviewToFront:_myBtn];
    
}



-(void)initView
{
    if (!_myView) {
        
        
        
        _myView = [[UIView alloc]initWithFrame:CGRectMake(_w-70+_x, _h-70+_y, 70, 70)];
        _myView.backgroundColor = [UIColor clearColor];
        _myView.tag = 110;
        _myView1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
        _myView1.backgroundColor = [UIColor clearColor];
        _myView1.alpha = 0.2 ;
        _myView.hidden = NO;
        
        [_myView addSubview:_myView1];
        
        _isOpen = NO;
        
        _myBtn = [MyButton2 buttonWithType:UIButtonTypeCustom];
        _myBtn.frame=CGRectMake(0, 0, 70, 70);
        [_myBtn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_openImg]] forState:UIControlStateNormal];
        _myBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _myBtn.titleLabel.textColor = [UIColor brownColor];
        [_myBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_myBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_rootBG]] forState:UIControlStateNormal];
        [_myBtn setTitle:_openTitle forState:UIControlStateNormal];
        [_myBtn addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
        [_myView addSubview:_myBtn];
        
        
        _buttons = [NSMutableArray arrayWithCapacity:5];
        for (int i=0; i<_imgs.count; i++) {
            UIButton *btn=[self makeButton:[self.uexObj absPath:[_imgs objectAtIndex:i]] tag:i];
            [_buttons addObject:btn];
        }
        
        
        
        double radius=200;
        CGPoint radialCenter=CGPointMake(320, _h);
        
        CGRect viewRect =CGRectMake(_w-320,0,320, _h);
        NSString * background = [self.uexObj absPath:_subBg];
        _rootView =[[JCArcButtonWheelView alloc] initWithFrame:viewRect buttonArray:_buttons leftHanded:FALSE arcCenter:radialCenter radius:radius background:background];
        
        [_myView addSubview:_rootView];
        
        [_rootView release];
        
        CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI*0.5);//逆时针为负数，正则是顺时针
        CGRect frame = _rootView.controlView.frame;
        _rootView.controlView.layer.anchorPoint =CGPointMake(1,1);//设置旋转的中心点（锚点）
        _rootView.controlView.frame = frame;//设置anchorPont会使view的frame改变。重新赋值。
        //一个2秒的动画，实现旋转。
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDuration:0.0f];
        _rootView.controlView.transform = transform;
        [UIView commitAnimations];
        
        [_myView bringSubviewToFront:_myBtn];
        
        
        _view = [[UIView alloc]initWithFrame:_myView.frame];
        [EUtility brwView:self.uexObj.meBrwView addSubview:_view];
        [_view.window addSubview:_myView];
        
    }
}


-(void)open:(NSMutableArray *)inArguments
{
    
    if (inArguments.count == 4) {
        _x = [[inArguments objectAtIndex:0] floatValue];
        _y = [[inArguments objectAtIndex:1]floatValue] +20;
        _w = [[inArguments objectAtIndex:2] floatValue];
        _h = [[inArguments objectAtIndex:3] floatValue];
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        for(UIView *view in window.subviews)
        {
            if (view.tag == 110) {
                _myView = view;
            }
        }
        
        [self initView];
        
    }
    
    
    _myView.hidden = NO;
    _view.hidden = NO;
    if (_isOpen) {
        
        [UIView animateWithDuration:0 animations:^{
            
            CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI*0.5);//逆时针为负数，正则是顺时针
            CGRect frame = _rootView.controlView.frame;
            _rootView.controlView.layer.anchorPoint =CGPointMake(1,1);//设置旋转的中心点（锚点）
            _rootView.controlView.frame = frame;//设置anchorPont会使view的frame改变。重新赋值。
            //一个2秒的动画，实现旋转。
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration:0];
            _rootView.controlView.transform = transform;
            [UIView commitAnimations];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                _myView.frame= CGRectMake(_w-70+_x, _h-70+_y, 70, 70);
                _myView1.frame= CGRectMake(0, 0, 70, 70);
                
                _myBtn.frame = CGRectMake(0, 0, 70, 70);
                _myView1.backgroundColor = [UIColor clearColor];
                //                _rootView.frame = CGRectMake(320, 568, 0, 0);
                
            } completion:^(BOOL finished) {
            }];
            
        }];
        
        [_myBtn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:_openImg]] forState:UIControlStateNormal];
        [_myBtn setTitle:_openTitle forState:UIControlStateNormal];
        _isOpen = NO;
        
        
    }
    
    
}

-(void)close:(NSMutableArray *)inArguments
{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    for(UIView *view in window.subviews)
    {
        if (view.tag == 110) {
            view.hidden = YES;
        }
    }
    _myView.hidden = YES;
    _view.hidden = YES;
}


@end

