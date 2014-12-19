//
//  AnimationItem.h
//  AnimationLesson1
//
//  Created by zangqilong on 14/12/19.
//  Copyright (c) 2014年 zangqilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationItem : UIView

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image withText:(NSString *)text;

- (void)startAnimationWithdelay:(CGFloat)delay;

- (void)stopAnimationWithDelay:(CGFloat)delay;

@end
