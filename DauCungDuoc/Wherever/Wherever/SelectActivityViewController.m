//
//  SelectActivityViewController.m
//  DauCungDuoc
//
//  Created by mac on 12/16/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "SelectActivityViewController.h"
#import "Activity.h"
@interface SelectActivityViewController () {
    NSMutableArray *arrayData;
    AddActivityViewController *addVC;
}

@end

@implementation SelectActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    addVC = [[AddActivityViewController alloc] init];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    arrayData = [[NSMutableArray alloc] init];
    arrayData = [[Activity MR_findAll] mutableCopy];
    [self.tableViewData reloadData];
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
    Activity *activity = arrayData[indexPath.row];
    UILabel *label = (UILabel*)[cell viewWithTag:1];
//    UIImageView *imageView = (UIImageView*)[cell viewWithTag:2];
    label.text = activity.name;
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Activity *activityToRemove = arrayData[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayData removeObjectAtIndex:indexPath.row];
        [activityToRemove MR_deleteEntity];
        [self saveContext];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Activity *newActivity = arrayData[sourceIndexPath.row];
    [arrayData removeObjectAtIndex:sourceIndexPath.row];
    [arrayData insertObject:newActivity atIndex:destinationIndexPath.row];
    [self saveContext];
}

- (void)saveContext {
    //sử dụng ManagedObjectContext để lưu
//    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}
@end
