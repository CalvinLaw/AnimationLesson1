//
//  AnimationItem.m
//  AnimationLesson1
//
//  Created by zangqilong on 14/12/19.
//  Copyright (c) 2014年 zangqilong. All rights reserved.
//

#import "AnimationItem.h"
#import "MacroDefinition.h"

const CGFloat kButtonWidth = 120;

@interface AnimationItem ()
{
    UIButton *button;
    UILabel *titleLabel;
}

@end

@implementation AnimationItem

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image withText:(NSString *)text
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(0, 0, kButtonWidth, kButtonWidth);
        button.layer.cornerRadius = kButtonWidth/2;
        button.layer.masksToBounds = YES;
        [button setImage:image forState:UIControlStateNormal];
        button.userInteractionEnabled = NO;
        [self addSubview:button];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kButtonWidth, 20)];
        titleLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-10);
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment  = NSTextAlignmentCenter;
        titleLabel.text = text;
        titleLabel.alpha = 0.;
        [self addSubview:titleLabel];
        
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
       
        
    }
    return self;
}

- (void)startAnimationWithdelay:(CGFloat)delay
{
    [UIView animateWithDuration:0.5 delay:delay usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
      
        
    } completion:^(BOOL finished) {
       
    }];
    
    [UIView animateWithDuration:0.5 delay:delay+0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        titleLabel.alpha = 1.;
    } completion:^(BOOL finished) {
        
    } ];
}

- (void)stopAnimationWithDelay:(CGFloat)delay
{
    [UIView animateWithDuration:0.1 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.transform = CGAffineTransformMakeScale(0.1, 0.1);
                self.alpha = 0;
                
            } completion:^(BOOL _finished) {
                self.alpha = 1;
                titleLabel.alpha = 0;
            }];
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.alpha = 0.8;
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1.;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
