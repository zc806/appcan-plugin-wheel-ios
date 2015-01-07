//
//  MyView.h
//  AppCanPlugin
//
//  Created by zhijian du on 14-4-18.
//  Copyright (c) 2014年 zywx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EUExBase.h"

@protocol MyViewDelegate <NSObject>

-(void)sendBack:(NSString *)str;

@end

@interface MyView : UIView

@property (nonatomic ,assign) id<MyViewDelegate> delegate;
@property (nonatomic ,retain) NSMutableArray * inArguments;
@property (nonatomic ,copy) NSString * jsData;
@property (nonatomic,retain) EUExBase * uexObj;


-(void)wind;
-(void)close;
@end
