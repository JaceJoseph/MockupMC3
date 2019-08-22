//
//  NudgePageViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 20/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class NudgePageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "1")
        let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "2")
        let page3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "3")
        let page4: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "4")
        let page5: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "5")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        pages.append(page5)
        
        setViewControllers([page1], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.firstIndex(of: viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.firstIndex(of: viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
