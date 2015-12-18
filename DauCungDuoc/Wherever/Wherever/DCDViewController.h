//
//  DCDViewController.h
//  DauCungDuoc
//
//  Created by mac on 12/10/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCDRotaryProtocol.h"
@interface DCDViewController: UIViewController<DCDRotaryProtocol>

@property (nonatomic, strong) UILabel *valueLabel;

@end
