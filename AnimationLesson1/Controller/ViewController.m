//
//  ViewController.m
//  AnimationLesson1
//
//  Created by zangqilong on 14/12/19.
//  Copyright (c) 2014年 zangqilong. All rights reserved.
//

#import "ViewController.h"
#import "MacroDefinition.h"
#import "AnimationItem.h"

const CGFloat kItemWidth = 120.;
const CGFloat kItemHeight = 140.;

@interface ViewController ()
{
    NSMutableArray *itemArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(26, 167, 99);
    
    itemArray = [NSMutableArray array];
    
    NSArray *imageArray = @[@"contact",@"game",@"message",@"painting",@"record",@"safe"];
    NSArray *textArray = @[@"联系人",@"游戏",@"短信",@"画板",@"录音",@"安全"];
    
    CGFloat mWidthDelta = (SCREEN_WIDTH-kItemWidth *2)/3;
    NSLog(@"width delta is %f",mWidthDelta);
    CGFloat mHeightDelta = (SCREEN_HEIGHT - kItemHeight*3)/4;
    
    for (int list = 0; list < 3; list++) {
        for (int row = 0; row <2; row++) {
            AnimationItem *item = [[AnimationItem alloc] initWithFrame:CGRectMake(mWidthDelta*(row+1)+kItemWidth*row, mHeightDelta*(list+1)+kItemHeight*list, kItemWidth, kItemHeight) withImage:[UIImage imageNamed:imageArray[2*list+row]] withText:textArray[2*list+row]];
            [self.view addSubview:item];
            [itemArray addObject:item];
        }
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startAnimation:(id)sender
{
    
    NSInteger count = itemArray.count;
    for (int i = 0; i< count; i++) {
        AnimationItem *item = itemArray[i];
        [item startAnimationWithdelay:i*0.1];
    }
}

- (IBAction)stopAnimation:(id)sender
{
    
    NSInteger count = itemArray.count;
    for (int i = count-1; i>=0; i--) {
        AnimationItem *item = itemArray[i];
        [item stopAnimationWithDelay:(count-1-i)*0.1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
