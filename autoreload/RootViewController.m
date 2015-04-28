//
//  RootViewController.m
//  autoreload
//
//  Created by Cyrille Legrand on 28/04/15.
//  Copyright (c) 2015 userADgents. All rights reserved.
//

#import "RootViewController.h"
#import "PopupViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [NSMutableArray new];
    for (NSInteger i = -1; i <= 1; i++)
        [self.data addObject:[NSString stringWithFormat:@"Day %ld", (long)i]];
}

- (IBAction)didTapReload:(id)sender {
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"Datasource asked for number of rows");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Datasource asked for number of sections in row, is %ld", (long)self.data.count);
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Datasource asked for cell at index path (%ld, %ld)", (long)indexPath.section, (long)indexPath.row);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (IBAction)didTapAdd:(id)sender {
    PopupViewController *popupVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PopupViewController"];
    popupVC.parentData = self.data;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:popupVC];
    [self presentViewController:nav animated:YES completion:NULL];
}

@end