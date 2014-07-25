//
//  MAPageViewController.h
//  MAPageViewController
//
//  Created by Mike on 7/24/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    NSArray *_viewControllers;
    UIPageViewController *_pageViewController;
    UIPageControl *_pageControl;
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers;

@end
