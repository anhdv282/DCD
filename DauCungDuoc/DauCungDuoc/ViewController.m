//
//  ViewController.m
//  DauCungDuoc
//
//  Created by mac on 12/9/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//
#define TIME_SPEED 0.01
#define TIME_STEP 0.001
#import "ViewController.h"

@interface ViewController (){
    NSArray *arrayData;
    NSTimer *timer;
    CGFloat angel,timeInterval,random,radian;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayData = [[NSArray alloc] initWithObjects:@"Hotel",@"Resto",@"Coffe",@"Hospital",@"Hotel",@"Resto",@"Coffe",@"Hospital", nil];
    [self reset];
    [self addRollView];
}

- (void)addRollView {
    NSString *nameImage = [NSString stringWithFormat:@"%@%lu",@"Roll",(unsigned long)[arrayData count]];
    UIImage *image = [UIImage imageNamed:nameImage];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    imageView.image = image;
    [self.rollView addSubview:imageView];
//    for (int i = 0; i < arrayData.count; i++) {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 100, 20)];
    label.layer.anchorPoint = CGPointMake(0.5, 1);
    label.textColor = [UIColor redColor];
    label.text = @"Hotel";
    label.backgroundColor = [UIColor blueColor];
    radian = (45)*M_PI/180;
    label.transform = CGAffineTransformMakeRotation(radian);
    label.textAlignment = NSTextAlignmentCenter;
        [self.rollView addSubview:label];
    [self.rollView bringSubviewToFront:label];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnRollTapped:(id)sender {
    [self reset];
    timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(rollBall) userInfo:nil repeats:YES];
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

-(void) reset {
    angel = 0.0;
    random = [self randomFloatBetween:20.0 and:50.0];
    timeInterval = TIME_SPEED;
}

- (void) rollBall {
    CGFloat deltaAngel = 0.1;
    angel += deltaAngel;
    self.rollView.transform = CGAffineTransformMakeRotation(angel);
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
@end
