//
//  AddActivityViewController.h
//  Wherever
//
//  Created by mac on 12/17/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Activity;
@interface AddActivityViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UICollectionView *iconCollectionView;
@property (nonatomic) Activity *activity;
- (void)showInView:(BOOL)animated aView:(UIView *)aView;
@end
