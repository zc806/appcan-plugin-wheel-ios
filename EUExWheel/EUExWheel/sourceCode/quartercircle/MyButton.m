//
//  MyButton.m
//  HuaTaiDemo
//
//  Created by zhijian du on 14-3-6.
//  Copyright (c) 2014年 demo. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(-3, 25, 35, 20);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, 18, 18);
}

@end
