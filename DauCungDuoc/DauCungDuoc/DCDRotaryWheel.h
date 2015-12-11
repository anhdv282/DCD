//
//  DCDRotaryWhell.h
//  DauCungDuoc
//
//  Created by mac on 12/10/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCDRotaryProtocol.h"
@interface DCDRotaryWheel : UIControl
@property (weak) id <DCDRotaryProtocol> delegate;
@property (nonatomic, strong) UIView *container;
@property int numberOfSections;
@property CGAffineTransform startTransform;
@property (nonatomic, strong) NSMutableArray *cloves;
@property int currentValue;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;

@end
