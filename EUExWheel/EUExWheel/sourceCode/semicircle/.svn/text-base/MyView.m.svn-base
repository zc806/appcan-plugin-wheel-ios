//
//  MyView.m
//  AppCanPlugin
//
//  Created by zhijian du on 14-4-18.
//  Copyright (c) 2014年 zywx. All rights reserved.
//

#import "MyView.h"
#import "JSON.h"
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation MyView
{
    UIImageView *_myImageView;
    UIView *_myView;
    UIView *_myView1;
    NSMutableArray *_btnImages;
    NSMutableArray *_btnSelectImages;
    NSArray *_arrays;
    UILabel *_showLabel;
    float _x;
    float _y;
    float _width ;
    float _height;
}


@synthesize delegate;
@synthesize inArguments ;

-(void)dealloc
{
    [_myImageView release];
    
    [_showLabel release];
    
    [_myView1 release];
    [_myView release];
    
    [_btnSelectImages release];
    [_btnImages release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _x = self.frame.origin.x;
        _y = self.frame.origin.y;
        _width = self.frame.size.width;
        _height = self.frame.size.height;
        
    }
    return self;
}

-(void)wind{
    
    [self initView];
    _myView.hidden = NO;
    _myImageView.hidden = NO;
    _showLabel.text = @"";
    
    _myView1.backgroundColor = [UIColor blackColor];
    _myView1.alpha = 0.2;
    
    if (_arrays.count > 0) {
        for(UIButton * bb in _arrays)
        {
            [bb setImage:[_btnImages objectAtIndex:bb.tag] forState:UIControlStateNormal];
        }
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        _myImageView.frame = CGRectMake(_width/2-160, _height-100, 320, 100);
    }];
    [self.window addSubview:_myView];
}



-(UIButton *)makeButton:(UIImage *)image tag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *im = image;
    btn.titleLabel.font = [UIFont  systemFontOfSize:13];
    [btn setImage:im forState:UIControlStateNormal];
    [btn setTag:tag];
    CGRect r = CGRectMake(0,0, im.size.width, im.size.height);
    btn.frame=r;
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    if ([_btnImages count] >= 5) {
        if (btn.tag == 0) {
            btn.frame = CGRectMake(40, 65,22, 20);
        }
        if (btn.tag == 1) {
            btn.frame = CGRectMake(85, 35,22, 20);
        }
        if (btn.tag == 2) {
            btn.frame = CGRectMake(147, 20,22, 22);
        }
        if (btn.tag == 3) {
            btn.frame = CGRectMake(210, 35,22, 20);
        }
        if (btn.tag == 4) {
            btn.frame = CGRectMake(260, 65,22, 20);
        }
    }
    if ([_btnImages count] == 4) {
        if (btn.tag == 0) {
            btn.frame = CGRectMake(40, 65,22, 20);
        }
        if (btn.tag == 1) {
            btn.frame = CGRectMake(100, 20,22, 20);
        }
        if (btn.tag == 2) {
            btn.frame = CGRectMake(195, 20,22, 20);
        }
        if (btn.tag == 3) {
            btn.frame = CGRectMake(260, 65,22, 20);
        }
    }
    if ([_btnImages count] == 3) {
        if (btn.tag == 0) {
            btn.frame = CGRectMake(40, 65,22, 20);
        }
        if (btn.tag == 1) {
            btn.frame = CGRectMake(147, 20,22, 22);
        }
        if (btn.tag == 2) {
            btn.frame = CGRectMake(260, 65,22, 20);
        }
    }
    
    return btn;
}
-(void)buttonPressed:(UIButton *)btn
{
    NSArray *btnArray = btn.superview.subviews;
    _arrays = [NSArray arrayWithArray:btnArray];//[[NSArray arrayWithObjects:[btnArray objectAtIndex:0],[btnArray objectAtIndex:1],[btnArray objectAtIndex:2],[btnArray objectAtIndex:3],[btnArray objectAtIndex:4], nil] retain];
    for(UIButton * bb in _arrays)
    {
        if (bb.tag == btn.tag) {
            [btn setImage:[_btnSelectImages objectAtIndex:btn.tag] forState:UIControlStateNormal];
        }
        else
        {
            if ([bb isKindOfClass:[UIButton class]]) {
                [bb setImage:[_btnImages objectAtIndex:bb.tag] forState:UIControlStateNormal];
            }
            
        }
    }
    if (btn.tag == 0) {
        _showLabel.text = @"信息";
    }
    if (btn.tag == 1) {
        _showLabel.text = @"排序";
    }
    if (btn.tag == 2) {
        _showLabel.text = @"拍照";
    }
    if (btn.tag == 3) {
        _showLabel.text = @"图片";
    }
    if (btn.tag == 4) {
        _showLabel.text = @"视频";
    }
    [self close];
    NSString *jSonStr = [NSString stringWithFormat:@"%d", btn.tag];
    [self.delegate sendBack:jSonStr];
}
-(void)initView
{
    SBJsonParser* jsonParser=[[SBJsonParser alloc]init];
    NSMutableDictionary * jsonDic=[jsonParser objectWithString:self.jsData];
    NSString * background = [jsonDic objectForKey:@"background"];
    NSMutableArray * dataArray = [jsonDic objectForKey:@"data"];
    
    
    
    
    CGRect rect;
    rect = CGRectMake(0, (IPHONE5?568:480-25), 320, 100);
    if (!_myView) {
        _myView= [[UIView alloc]initWithFrame:CGRectMake(_x, _y+20, _width, _height)];
        _myView.backgroundColor = [UIColor clearColor];
        _myView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        [_myView addSubview:_myView1];
        _btnImages = [[NSMutableArray alloc] init];
        _btnSelectImages = [[NSMutableArray alloc] init];
        for (NSDictionary * tempDic in dataArray) {
            NSString * image = [tempDic objectForKey:@"image"];
            NSString * title = [tempDic objectForKey:@"title"];
            NSString * imagePath = [self.uexObj absPath:image];
            [_btnImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
            [_btnSelectImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
        }
        
    }
    
    if (!_myImageView) {
        _myImageView= [[UIImageView alloc]initWithFrame:CGRectMake(_width/2-160, _height, 320, 100)];
        _myImageView.image = [UIImage imageWithContentsOfFile:[self.uexObj absPath:background]];
        _myImageView.userInteractionEnabled = YES;
        for (int i = 0; i < [_btnImages count]; i++) {
            UIImage * image = [_btnImages objectAtIndex:i];
            UIButton * btn = [self makeButton:image tag:i];
            [_myImageView addSubview:btn];
            
        }
        
//        UIButton *btn1 = [self makeButton:@"uexRouletteMenu1/plugin_uexroulettemenu1_1" tag:0];
//        UIButton *btn2 = [self makeButton:@"uexRouletteMenu1/plugin_uexroulettemenu1_2" tag:1];
//        UIButton *btn3 = [self makeButton:@"uexRouletteMenu1/plugin_uexroulettemenu1_3" tag:2];
//        UIButton *btn4 = [self makeButton:@"uexRouletteMenu1/plugin_uexroulettemenu1_4" tag:3];
//        UIButton *btn5 = [self makeButton:@"uexRouletteMenu1/plugin_uexroulettemenu1_5" tag:4];
//        [_myImageView addSubview:btn1];
//        [_myImageView addSubview:btn2];
//        [_myImageView addSubview:btn3];
//        [_myImageView addSubview:btn4];
//        [_myImageView addSubview:btn5];
        
        _showLabel = [[UILabel alloc]init];
        _showLabel.frame = CGRectMake(139, 65, 40, 25);
        _showLabel.text = @"  ";
        _showLabel.textColor = [UIColor brownColor];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.backgroundColor = [UIColor clearColor];
        [_myImageView addSubview:_showLabel];
        
        [_myView addSubview:_myImageView];
        
        //裁剪超出区域
        _myView.clipsToBounds = YES;
    }
}
-(void)close
{
    [UIView animateWithDuration:0 animations:^{
//        CGRect rect = CGRectMake(0, (IPHONE5?568:480-25), 320, 100);
        _myImageView.hidden = YES;
        _myImageView.frame = CGRectMake(_width/2-160, _height, 320, 100);
    } completion:^(BOOL finished) {
        _myView.hidden = YES;
        _myImageView.hidden = YES;
    }];
    
}
@end
