//
//  Circle.m
//  EUExRouletteMenu
//
//  Created by RAY on 14-8-27.
//  Copyright (c) 2014年 RAY. All rights reserved.
//

#import "Circle.h"
#import "EUtility.h"
#import "EUExBaseDefine.h"
#import "CDCircleOverlayView.h"
#import "SBJSON.h"
#import "CDCircleGestureRecognizer.h"


@implementation Circle

-(void)dealloc{
    [_uexObj release];
    [_myView1 release];
    [_myView2 release];
    [_bar release];
    [_imageView release];
    [_circle release];
    [_overlay release];
    [_view release];
    [_circleArray release];
    [_overlayArray release];
    [_menuArray release];
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
        self.index_main = 0;
        self.index_sub = 0;
    }
    return self;
}

-(void)close{
    UIView * mainView = (UIView *)self.uexObj.meBrwView;
    for(UIView *view in mainView.subviews)
    {
        if (view.tag == 111) {
            view.hidden = YES;
        }
    }
}

-(void)open{
    UIView * mainView = (UIView *)self.uexObj.meBrwView;
    for(UIView *view in mainView.subviews)
    {
        if (view.tag == 111) {
            _myView1 = view;
        }
    }
    [self initView];
    _myView1.hidden = NO;
    _view.hidden = NO;
    [_bar onButton:nil];
}

- (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte,alphaByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    alphaByte = (unsigned char) (colorCode >> 24);
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:(float)alphaByte / 0xff];
    return result;
}

-(UIImage *)getImageFromLocalFile:(NSString*)imageName {
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
}

-(void)initView {
    
    if (!_myView1) {
        /* ---------------------------------------------------------
         * json
         * -------------------------------------------------------*/
        SBJsonParser* jsonParser=[[SBJsonParser alloc]init];
        NSMutableDictionary * jsonDic=[jsonParser objectWithString:self.jsData];
        self.bgColor = [jsonDic objectForKey:@"bgColor"];
        NSString * button=[jsonDic objectForKey:@"button"];
        NSString * iconLeft = [jsonDic objectForKey:@"iconLeft"];
        NSString * iconSelect = [jsonDic objectForKey:@"iconSelect"];
        _menuArray=[[jsonDic objectForKey:@"menu"] retain];
        NSString * menuBg=[jsonDic objectForKey:@"menuBg"];
        NSString * subMenuBg=[jsonDic objectForKey:@"subMenuBg"];
        /* ---------------------------------------------------------
         * Setup buttons
         * Note: I am setting the frame to the size of my images
         * -------------------------------------------------------*/
        self.btnH = _h/5;
        float padding = self.btnH/3;
        
        int count = (int)[_menuArray count];
        int num = count < 5 ? count : 5;
        self.btnW = (_w-self.btnH-padding)/num;
        
        CGRect buttonFrame = CGRectMake(0, 0, self.btnW, self.btnH);
        /* ---------------------------------------------------------
         * Create the center for the main button and origin of animations
         * -------------------------------------------------------*/
        CGPoint center = CGPointMake(self.btnW/2, self.btnH/2);
        //*********************************************************
        _myView1 = [[UIView alloc]init];
        _myView1.tag = 111;
        _myView1.frame = CGRectMake(_x, _y, self.btnW, self.btnH);
        _myView1.backgroundColor = [UIColor clearColor];
        
        _view = [[UIView alloc]initWithFrame:_myView1.frame];
        _view.frame = CGRectMake(0, 64, 60, 70);
        UIView * view = (UIView *)self.uexObj.meBrwView;
        [view addSubview:_myView1];
        //[EUtility brwView:self.uexObj.meBrwView addSubview:_view];
        //[_view addSubview:_myView1];
        //[_view.window addSubview:_myView1];
        
        _view.hidden = YES;
        _myView2 = [[UIView alloc]init];
        _myView2.frame = CGRectMake(0, 0, 60, 100);
        
        _myView2.backgroundColor = [self colorFromHexRGB:self.bgColor];
        [_myView1 addSubview:_myView2];
        
        /* ---------------------------------------------------------
         * Create images that are used for the main button
         * -------------------------------------------------------*/
        UIImage *image = [UIImage imageWithContentsOfFile:[self.uexObj absPath:button]];
        UIImage *selectedImage = [UIImage imageWithContentsOfFile:[self.uexObj absPath:iconSelect]];
        UIImage *toggledImage = [UIImage imageWithContentsOfFile:[self.uexObj absPath:menuBg]];
        UIImage *toggledSelectedImage = [UIImage imageWithContentsOfFile:[self.uexObj absPath:iconSelect]];
        UIImage *leftIconImage = [UIImage imageWithContentsOfFile:[self.uexObj absPath:iconLeft]];
        
        NSMutableArray * buttons = [NSMutableArray array];
        for (int i = 0; i < _menuArray.count; i++) {
            NSMutableDictionary * dic=[_menuArray objectAtIndex:i];
            UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:buttonFrame];
            //[btn setImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:[dic objectForKey:@"img"]]] forState:UIControlStateNormal];
            UIImageView * img = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[self.uexObj absPath:[dic objectForKey:@"img"]]]];
            img.frame = CGRectMake(btn.bounds.size.width/5, btn.bounds.size.height/5, btn.bounds.size.width*3/5, btn.bounds.size.height*3/5);
            img.contentMode = UIViewContentModeScaleAspectFit;
            [btn addSubview:img];
            
            [img release];
            
            
            btn.contentMode = UIViewContentModeScaleAspectFit;
            btn.tag=i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [buttons addObject:btn];
        }
        
        /* ---------------------------------------------------------
         * Init method, passing everything the bar needs to work
         * -------------------------------------------------------*/
        CGRect rect = CGRectMake(_x, _y, _w, _h);
        _bar = [[RNExpandingButtonBar alloc] initWithImage:image selectedImage:selectedImage toggledImage:toggledImage toggledSelectedImage:toggledSelectedImage buttons:buttons center:center rect:rect leftIcon:leftIconImage];
        /* ---------------------------------------------------------
         * Settings
         * -------------------------------------------------------*/
        _bar.delegateM = self;
        //设置是否旋转出来
        //    [_bar setSpin:YES];
        //设置是否水平 还是垂直
        [_bar setHorizontal:YES];
        //设置点击按钮是否出现爆炸效果
        //    [_bar setExplode:YES];
        //设置按钮之间的间隔
//        [_bar setPadding:padding];
        
        //    [EUtility brwView:self.meBrwView addSubview:_bar];
        [_myView1 addSubview:_bar];
        
        /* ---------------------------------------------------------
         * Init method, passing everything the bar needs to work
         ******************这是分割线***********************
         * -------------------------------------------------------*/
        float r = MIN(_w, _h)*2/6;
        self.imageViewX=_w/2-r;
        self.imageViewY=self.btnH+(_h-self.btnH)/2-r;
        self.imageViewW=2*r;
        self.imageViewH=2*r;
        
        if (self.flag==1) {
            r=MIN(_w*4/9, _h*2/3);
            self.imageViewX=_w/2-r;
            self.imageViewY=_h-r;
            self.imageViewW=2*r;
            self.imageViewH=2*r;
        }
        
        _imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(self.imageViewX, self.imageViewY, self.imageViewW, self.imageViewH)];
        NSString *fileString = [self.uexObj absPath:subMenuBg];
        _imageView.image = [UIImage imageWithContentsOfFile:fileString];
        [_myView1 addSubview: _imageView];
        _imageView.hidden = YES;
        _circleArray = [[NSMutableArray array] retain];
        _overlayArray = [[NSMutableArray array] retain];
        for (int i = 0; i < _menuArray.count; i ++) {
            NSMutableDictionary * dic=[_menuArray objectAtIndex:i];
            NSMutableArray * tempArr=[dic objectForKey:@"subMenu"];
            CDCircle * tempCircle = [[CDCircle alloc]initWithFrame:CGRectMake(self.imageViewX, self.imageViewY, self.imageViewW, self.imageViewH) numberOfSegments:tempArr.count ringWidth:r/3*2];
            tempCircle.recognizer.delegate = self;
            tempCircle.separatorStyle = CDCircleThumbsSeparatorNone ;
            tempCircle.separatorColor = [UIColor yellowColor];
            tempCircle.dataSource = self;
            tempCircle.delegate = self;
            tempCircle.tag=i;
            
            [_circleArray addObject:tempCircle];
            CDCircleOverlayView* overLay=[[CDCircleOverlayView alloc]initWithCircle:tempCircle];
            
            
            overLay.tag=i;
            [_overlayArray addObject:overLay];
            [_myView1 addSubview:tempCircle];
            [_myView1 addSubview:overLay];
            tempCircle.hidden=YES;
            overLay.hidden=YES;
        }
        _circle=[_circleArray objectAtIndex:0];
        _overlay=[_overlayArray objectAtIndex:0];
        
        
        
    }
}

-(void)btnClick:(UIButton *)btn {
    
    float r = MIN(_w, _h)*2/6;
    if (self.flag==1) {
        r=MIN(_w*4/9, _h*2/3);
    }
    _circle.hidden = YES;
    _overlay.hidden = YES;
    
    int tag=btn.tag;
    self.index_main = tag;
    _circle=[_circleArray objectAtIndex:tag];
    _circle.hidden=NO;
    _overlay=[_overlayArray objectAtIndex:tag];
    _overlay.hidden=NO;
    _circle.alpha = 0;
    _overlay.alpha =0;
    _imageView.frame=CGRectMake(2*r, 2*r+self.btnH, 0, 0);
    
    [UIView animateWithDuration:0.2 animations:^{
        _imageView.frame = CGRectMake(self.imageViewX, self.imageViewY, self.imageViewW, self.imageViewH);
    } completion:^(BOOL finished) {
        _circle.alpha= 1;
        _overlay.alpha = 1;
    }];
}

#pragma mark - RNExpandingButtonBarDelegate

-(void)closeTheRouletteMenu {
    _myView1.frame = CGRectMake(_x, _y, self.btnW, self.btnH);
    _myView2.frame = CGRectMake(0, 0, 60, 100);
    _myView2.backgroundColor = [UIColor clearColor];
    _imageView.hidden = YES;
    _circle.hidden = YES;
    _overlay.hidden = YES;
}

-(void)openTheRouletteMenu {
    _myView1.frame = CGRectMake(_x, _y, _w, _h);
    _myView2.frame = CGRectMake(0, 0, _w, _h);
    _myView2.backgroundColor = [self colorFromHexRGB:self.bgColor];
    
    _imageView.hidden = NO;
    _circle.hidden = NO;
    _overlay.hidden = NO;
}

- (void) expandingBarWillAppear:(RNExpandingButtonBar*)bar{
    
}

- (void) expandingBarDidAppear:(RNExpandingButtonBar *)bar{
    
}

- (void) expandingBarWillDisappear:(RNExpandingButtonBar *)bar{
    
}

- (void) expandingBarDidDisappear:(RNExpandingButtonBar *)bar{
    
}


#pragma mark - Circle delegate & data source

-(void) circle:(CDCircle *)circle didMoveToSegment:(NSInteger)segment thumb:(CDCircleThumb *)thumb {
    NSString *jSonStr = [NSString stringWithFormat:@"%d", segment];
    
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(updateMainView:) withObject:jSonStr waitUntilDone:YES];
    }else{
        int tag = [jSonStr intValue];
        self.index_sub = tag;
        //[_uexObj jsSuccessWithName:@"uexWheel.cbSelect" opId:self.index_main dataType:tag strData:jSonStr];
    }
}

- (void) callBack {
    [_uexObj jsSuccessWithName:@"uexWheel.cbSelect" opId:self.index_main dataType:self.index_sub strData:nil];
}

- (void) onClick {
    NSString * onClickStr = [NSString stringWithFormat:@"if(uexWheel.onClick!=null){uexWheel.onClick(%d);}",0];
    [_uexObj.meBrwView stringByEvaluatingJavaScriptFromString:onClickStr];
}


-(void)updateMainView:(NSString *)sender {
    //[_uexObj jsSuccessWithName:@"uexWheel.cbSelect" opId:1 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:sender];
}

-(UIImage *) circle:(CDCircle *)circle iconForThumbAtRow:(NSInteger)row {
    NSMutableDictionary * dic = [_menuArray objectAtIndex:circle.tag];
    NSMutableArray * array=[dic objectForKey:@"subMenu"];
    NSString * string=[array objectAtIndex:row];
    return [UIImage imageWithContentsOfFile:[self.uexObj absPath:string]];
}

@end
