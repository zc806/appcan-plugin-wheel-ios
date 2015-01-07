//
//  CDIconLabel.m
//  Wheel demo
//
//  Created by zhijian du on 14-3-17.
//
//

#import "CDIconLabel.h"
#import "CDIconView.h"
#import "MySingleton.h"

@implementation CDIconLabel

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.opaque =NO;
        self.backgroundColor = [UIColor clearColor];
  
        
        //        self.highlitedIconColor = [UIColor colorWithRed:0.75 green:0.00f blue:0.00f alpha:1.00f];
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    CDIconView *cdIconView = [[CDIconView alloc]init];
    if (cdIconView.image  != nil) {
        if (cdIconView.selected == YES)
        {
            
                MySingleton *mySingleton = [MySingleton sharedMySingleton];
                self.center = CGPointMake(CGRectGetMidX(mySingleton.rect), mySingleton.y);
    
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextTranslateCTM(context,  0, 20);
            
            //        CGContextTranslateCTM(context, 0, image.size.height);
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextSetBlendMode(context, kCGBlendModeColor);
            CGContextClipToMask(context, self.bounds, cdIconView.image.CGImage); // this restricts drawing to within alpha channel
        
            CGContextFillRect(context, rect);
            
        }
        else
        {
            
            [cdIconView.image drawInRect:rect];
            MySingleton *mySingleton = [MySingleton sharedMySingleton];
            self.center = CGPointMake(CGRectGetMidX(mySingleton.rect), mySingleton.y+15);
        }
    }
}



@end
