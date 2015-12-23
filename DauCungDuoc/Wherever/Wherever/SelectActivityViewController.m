//
//  SelectActivityViewController.m
//  DauCungDuoc
//
//  Created by mac on 12/16/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "SelectActivityViewController.h"

@interface SelectActivityViewController () {
    NSMutableArray *arrayData;
    AddActivityViewController *addVC;
}

@end

@implementation SelectActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayData = [[NSMutableArray alloc] init];
    addVC = [[AddActivityViewController alloc] init];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftBarButtonTapped:(UIButton *)sender {
//    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)rightBarButtonTapped:(UIButton *)sender {
    if (self.tableViewData.editing) {
        [self.tableViewData setEditing:false animated:YES];
        self.lblRightButton.text = @"Edit";
        
    } else {
        [self.tableViewData setEditing:true animated:YES];
        self.lblRightButton.text = @"Done";
    }
}

- (IBAction)bottomButtonTapped:(UIButton *)sender {
    [addVC showInView:YES aView:self.view];
}
#pragma mark TableView Datasource
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *label = (UILabel*)[cell viewWithTag:1];
//    UIImageView *imageView = (UIImageView*)[cell viewWithTag:2];
    label.text = [arrayData objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayData removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *newString = [[NSString alloc] init];
    newString = arrayData[sourceIndexPath.row];
    [arrayData removeObjectAtIndex:sourceIndexPath.row];
    [arrayData insertObject:newString atIndex:destinationIndexPath.row];
}

@end
