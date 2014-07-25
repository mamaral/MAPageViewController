//
//  TestObjectiveCNavigationController.m
//  MAPageViewController
//
//  Created by Mike on 7/24/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "TestObjectiveCNavigationController.h"
#import "MAPageViewController.h"

@interface TestObjectiveCNavigationController ()

@end

@implementation TestObjectiveCNavigationController

- (instancetype)init {
    UIViewController *purpleVC = [UIViewController new];
    purpleVC.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *grayVC = [UIViewController new];
    grayVC.view.backgroundColor = [UIColor grayColor];
    
    MAPageViewController *pageVC = [[MAPageViewController alloc] initWithViewControllers:@[purpleVC, grayVC]];
    pageVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self = [super initWithRootViewController:pageVC];
    return self;
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
