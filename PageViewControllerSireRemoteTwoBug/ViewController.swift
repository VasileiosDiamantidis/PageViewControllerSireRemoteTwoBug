//
//  ViewController.swift
//  PageViewControllerSireRemoteTwoBug
//
//  Created by Vasileios on 28.07.21.
//

import Foundation
import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var one: OneViewController!
    var two: TwoViewController!
    var three: ThreeViewController!
    
    var pages: [UIViewController] {
        return [one, two, three]
    }
    
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurePages()
        dataSource = self
        delegate = self
        setViewControllers([one], direction: .forward, animated: true, completion: nil)
    }
    
    private func configurePages() {
        one = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OneViewController") as? OneViewController
        two = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TwoViewController") as? TwoViewController
        three = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ThreeViewController") as? ThreeViewController
    }
    
    // MARK:- PageViewController
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = currentIndex - 1
        if index >= 0 {
            currentIndex = index
            return pages[index]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = currentIndex + 1
        if index <= 2 {
            currentIndex = index
            return pages[index]
        } else {
            return nil
        }
    }
}

