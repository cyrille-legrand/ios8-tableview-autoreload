//
//  PopupViewController.m
//  autoreload
//
//  Created by Cyrille Legrand on 28/04/15.
//  Copyright (c) 2015 userADgents. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (IBAction)didTapAddButton:(UIButton *)sender {

    if (sender.tag == 0)
        [self.parentData insertObject:@"Inserted row at beginning" atIndex:0];
    else
        [self.parentData addObject:@"Appended row at end"];

}

- (IBAction)didTapDone:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
