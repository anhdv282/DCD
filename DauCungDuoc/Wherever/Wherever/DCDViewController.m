//
//  DCDViewController.m
//  DauCungDuoc
//
//  Created by mac on 12/10/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//
#define TIME_SPEED 0.01
#define TIME_STEP 0.001
#import "DCDViewController.h"
#import "DCDRotaryWheel.h"
@implementation DCDViewController {
    DCDRotaryWheel *wheel;
    NSTimer *timer;
    CGFloat angel,timeInterval,random,radian;
}
@synthesize  valueLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,550, 120, 30)];
    valueLabel.textAlignment = NSTextAlignmentCenter;
    valueLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:valueLabel];
    
    wheel = [[DCDRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)
                                                    andDelegate:self
                                                   withSections:8];
    wheel.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.view addSubview:wheel];
  
}

- (void) wheelDidChangeValue:(NSString *)newValue {
    
    self.valueLabel.text = newValue;
    
}
// ấn btn
// xoay
// tính radian ra trong khoảng -> xác định được góc
// chuyển về mid value của Clove
- (IBAction)btnRollTapped:(id)sender {
    [self reset];
    timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(rollBall) userInfo:nil repeats:YES];
}

-(void) reset {
    angel = 0.0;
    random = [self randomFloatBetween:20.0 and:50.0];
    timeInterval = TIME_SPEED;
}

- (void) rollBall {
    CGFloat deltaAngel = 0.1;
    angel += deltaAngel;
    wheel.container.transform = CGAffineTransformMakeRotation(angel);
    NSLog(@"time : %f, angel: %f, random: %f",timeInterval,angel,random);
    if (angel >= random) {
        timeInterval += TIME_STEP;
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(rollBall) userInfo:nil repeats:YES];
        if (timeInterval >= 0.1) {
            [timer invalidate];
        }
    }
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}
@end
