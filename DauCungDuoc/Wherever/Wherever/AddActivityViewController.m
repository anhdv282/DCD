//
//  AddActivityViewController.m
//  Wherever
//
//  Created by mac on 12/17/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "AddActivityViewController.h"
#import "Macro.h"
#import "Activity.h"
@interface AddActivityViewController ()

@end

@implementation AddActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.layer.shadowOpacity = 0.8;
    self.popUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.view.center = CGPointMake(SCREEN_WIDTH_PORTRAIT/2, -SCREEN_HEIGHT_PORTRAIT/2);
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddTapped:(id)sender {
    [self addNewActivity];
}

- (void)showAnimate {
//    self.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.view.alpha = 0.0;
    self.view.center = CGPointMake(SCREEN_WIDTH_PORTRAIT/2, -SCREEN_HEIGHT_PORTRAIT/2);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.view.alpha = 1.0;
        self.view.center = CGPointMake(SCREEN_WIDTH_PORTRAIT/2, SCREEN_HEIGHT_PORTRAIT/2);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)removeAnimate {
    [UIView animateWithDuration:0.5 animations:^{
//        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.view.center = CGPointMake(SCREEN_WIDTH_PORTRAIT/2, -SCREEN_HEIGHT_PORTRAIT/2);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self.view removeFromSuperview];
        }
    }];
}

- (void)showInView:(BOOL)animated aView:(UIView *)aView {
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:self.view];
    [currentWindow bringSubviewToFront:self.view];
    if (animated)
    {
        [self showAnimate];
    }
}

- (IBAction)removeViewTapped:(UITapGestureRecognizer *)sender {
    [self removeAnimate];
}

#pragma mark Add new
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length] > 0) {
        self.activity.name = textField.text;
    }
}

- (void) initActivity {
    if (!self.activity) {
        self.activity = [Activity MR_createEntity];
    }
}

- (void) addNewActivity {
    
}

//luu
-(void)saveContext
{
//    [[NSManagedObjectContext defaultContext] saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
//            if (success) {
//            NSLog(@"you sucessfully saved your context");
//        }
//        else
//        {
//            NSLog(@"Error saving context: %@", error.description);
//        }    }];
}
@end
