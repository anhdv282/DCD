//
//  DCDViewController.m
//  DauCungDuoc
//
//  Created by mac on 12/10/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "DCDViewController.h"
#import "DCDRotaryWheel.h"
@implementation DCDViewController
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
    
    valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, 120, 30)];
    valueLabel.textAlignment = NSTextAlignmentCenter;
    valueLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:valueLabel];
    
    DCDRotaryWheel *wheel = [[DCDRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)
                                                    andDelegate:self
                                                   withSections:8];
    
    wheel.center = CGPointMake(160, 240);
    [self.view addSubview:wheel];
    
    
    
}

- (void) wheelDidChangeValue:(NSString *)newValue {
    
    self.valueLabel.text = newValue;
    
}

@end
