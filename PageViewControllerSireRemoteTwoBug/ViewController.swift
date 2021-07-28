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
        setUpGestures()
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
    
    // MARK: - Gestures
    
    func setUpGestures() {
        
        let tapUpGestureRecognizer = UITapGestureRecognizer(target: self, action: .tapUpGestureWasTriggered)
        // upArrow -> 0
        tapUpGestureRecognizer.allowedPressTypes = [0]
        view.addGestureRecognizer(tapUpGestureRecognizer)
        
        let tapDownGestureRecognizer = UITapGestureRecognizer(target: self, action: .tapDownGestureWasTriggered)
        // downArrow -> 1
        tapDownGestureRecognizer.allowedPressTypes = [1]
        view.addGestureRecognizer(tapDownGestureRecognizer)
        
        let tapLeftGestureRecognizer = UITapGestureRecognizer(target: self, action: .tapLeftGestureWasTriggered)
        // leftArrow -> 2
        tapLeftGestureRecognizer.allowedPressTypes = [2]
        view.addGestureRecognizer(tapLeftGestureRecognizer)
        
        let tapRightGestureRecognizer = UITapGestureRecognizer(target: self, action: .tapRightGestureWasTriggered)
        // rightArrow -> 3
        tapRightGestureRecognizer.allowedPressTypes = [3]
        view.addGestureRecognizer(tapRightGestureRecognizer)
    }
    
    @objc func tapUpGestureWasTriggered(gesture: UIGestureRecognizer) {
        print("tapUpGestureWasTriggered ✅") // ✅
    }
    
    @objc func tapDownGestureWasTriggered(gesture: UIGestureRecognizer) {
        print("tapDownGestureWasTriggered ✅") // ✅
    }
    
    @objc func tapLeftGestureWasTriggered(gesture: UIGestureRecognizer) {
        print("tapLeftGestureWasTriggered ❌") // ❌
    }
    
    @objc func tapRightGestureWasTriggered(gesture: UIGestureRecognizer) {
        print("tapRightGestureWasTriggered ❌") // ❌
    }
}

private extension Selector {
    static let tapUpGestureWasTriggered = #selector(ViewController.tapUpGestureWasTriggered)
    static let tapDownGestureWasTriggered = #selector(ViewController.tapDownGestureWasTriggered)
    static let tapLeftGestureWasTriggered = #selector(ViewController.tapLeftGestureWasTriggered)
    static let tapRightGestureWasTriggered = #selector(ViewController.tapRightGestureWasTriggered)
}


