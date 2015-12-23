//
//  SelectActivityViewController.h
//  DauCungDuoc
//
//  Created by mac on 12/16/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddActivityViewController.h"
@interface SelectActivityViewController : UIViewController<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewData;
@property (weak, nonatomic) IBOutlet UIButton *btnRightBar;
@property (weak, nonatomic) IBOutlet UIButton *btnBottom;
@property (weak, nonatomic) IBOutlet UILabel *lblRightButton;

@end
