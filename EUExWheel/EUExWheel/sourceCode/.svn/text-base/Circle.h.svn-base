//
//  Circle.h
//  EUExRouletteMenu
//
//  Created by RAY on 14-8-27.
//  Copyright (c) 2014年 RAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EUExBase.h"
#import "CDCircle.h"
#import "RNExpandingButtonBar.h"

@interface Circle : NSObject<CDCircleDataSource,CDCircleDelegate,RNExpandingButtonBarDelegate>

@property(nonatomic,retain)EUExBase* uexObj;
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)float w;
@property(nonatomic,assign)float h;
@property(nonatomic,retain)UIView *myView1;
@property(nonatomic,retain)UIView *myView2;
@property(nonatomic,retain)RNExpandingButtonBar *bar;
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)CDCircle *circle;
@property(nonatomic,retain)CDCircleOverlayView *overlay;
@property(nonatomic,retain)UIView *view;
@property(nonatomic,retain)NSMutableArray * circleArray;
@property(nonatomic,retain)NSMutableArray * overlayArray;
@property(nonatomic,retain)NSMutableArray * menuArray;
@property(nonatomic,copy)NSString * jsData;
@property(nonatomic,assign)int index_main;
@property(nonatomic,assign)int index_sub;
@property(nonatomic,assign)int flag;
@property(nonatomic,assign)float btnW;
@property(nonatomic,assign)float btnH;
@property(nonatomic,copy)NSString * bgColor;
@property(nonatomic,assign)float imageViewX;
@property(nonatomic,assign)float imageViewY;
@property(nonatomic,assign)float imageViewW;
@property(nonatomic,assign)float imageViewH;



- (void) onClick;
-(void)callBack;
-(id)initWithuexObj:(EUExBase*)uexObj andRect:(CGRect)rect;
-(void)open;
-(void)close;

@end
