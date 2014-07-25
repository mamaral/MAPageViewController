//
//  MAPageViewController.swift
//  MAPageViewController
//
//  Created by Mike on 6/19/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

import UIKit

class MAPageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    let pageViewController: UIPageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    let pageControl: UIPageControl = UIPageControl()
    let pageControlHeight: CGFloat = 40
    var viewControllers: UIViewController[] = []

    init(viewControllers: UIViewController[]) {
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        setupPageViewController()
    }
    
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self;
        pageViewController.view.frame = self.view.frame;
        pageViewController.setViewControllers([viewControllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        
        pageControl.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame) - pageControlHeight, self.view.bounds.size.width, pageControlHeight)
        pageControl.numberOfPages = viewControllers.count;
        pageControl.autoresizingMask = .FlexibleWidth | .FlexibleTopMargin
        self.view.addSubview(pageControl)
    }
    
    func indexOfViewController(viewController: UIViewController) -> Int {
        var indexOfVC: Int = 0
        for (index, element) in enumerate(viewControllers) {
            if element == viewController {
                indexOfVC = index
                break
            }
        }
        return indexOfVC
    }
    
    // PRAGMA: page view controller data source
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
        let indexOfCurrentVC = indexOfViewController(viewController)
        return indexOfCurrentVC < viewControllers.count - 1 ? viewControllers[indexOfCurrentVC + 1] : nil
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController!  {
        viewControllers.endIndex
        let indexOfCurrentVC = indexOfViewController(viewController)
        return indexOfCurrentVC > 0 ? viewControllers[indexOfCurrentVC - 1] : nil
    }
    
    // PRAGMA: page view controller delegate
    
    func pageViewController(pageViewController: UIPageViewController!, didFinishAnimating finished: Bool, previousViewControllers: AnyObject[]!, transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        
        let newViewController = pageViewController.viewControllers[0] as UIViewController
        pageControl.currentPage = indexOfViewController(newViewController)
    }
    
    

}
