//
//  Quartercircle.h
//  EUExRouletteMenu
//
//  Created by RAY on 14-8-30.
//  Copyright (c) 2014年 RAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EUExBase.h"
#import "JCArcButtonWheelView.h"
#import "MyButton2.h"

@interface Quartercircle : NSObject


@property(nonatomic,retain)EUExBase* uexObj;
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)float w;
@property(nonatomic,assign)float h;
@property(nonatomic,retain)JCArcButtonWheelView *rootView;
@property(nonatomic,retain)NSMutableArray *buttons;
@property(nonatomic,retain)MyButton2 *myBtn;
@property(nonatomic)BOOL isOpen;
@property(nonatomic,retain)UIView *myView;
@property(nonatomic,retain)UIView *myView1;
@property(nonatomic,retain)NSMutableArray * titleArray;
@property(nonatomic,retain)NSMutableArray *imgs;
@property(nonatomic,copy)NSString* openTitle;
@property(nonatomic,copy)NSString* openImg;
@property(nonatomic,copy)NSString* closeTitle;
@property(nonatomic,copy)NSString* closeImg;
@property(nonatomic,copy)NSString* rootBG;
@property(nonatomic,copy)NSString* subBg;
@property(nonatomic,copy)NSString * jsData;



@property(nonatomic,retain)UIView *view;


-(id)initWithuexObj:(EUExBase*)uexObj andRect:(CGRect)rect;
-(void)open;
-(void)close;

@end
