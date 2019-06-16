//
//  ViewController.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 14/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIPageViewController {
    
    var tabBar2: MDCTabBar!
    
    var blueController: UIViewController!
    var redController: UIViewController!
    
    var currentViewController: UIViewController!
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("red"),
                self.newColoredViewController("blue")]
    }()
    
    var tabItems: [UITabBarItem]!
    
    private func newColoredViewController(_ color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)Controller")
    }
    
    override func viewDidLoad() {
        dataSource = self
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupTabBar()
        setupViewControllers()
        
    }
    
    func setupTabBar() {
        
        var uiImage1 = UIImage(named: "access-point-network-off")
        uiImage1 = uiImage1?.resized(newSize: CGSize(width: 30, height: 30))
        
        var uiImage2 = UIImage(named: "access-point-network")
        uiImage2 = uiImage2?.resized(newSize: CGSize(width: 30, height: 30))
        
        tabItems = [
            UITabBarItem(title: "Recents", image: uiImage1, tag: 0),
            UITabBarItem(title: "Favorites", image: uiImage2, tag: 0),
        ]
        
        tabBar2 = MDCTabBar(frame: view.bounds)
        tabBar2.items = tabItems
        tabBar2.itemAppearance = .titledImages
        tabBar2.sizeToFit()
        
        tabBar2.delegate = self
        
        view.addSubview(tabBar2)
        
    }
    
    func setupViewControllers() {
        
        if let firstViewController = orderedViewControllers.first {
            currentViewController = firstViewController
            setViewControllers([currentViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
}

extension ViewController: MDCTabBarDelegate {
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        
        let lastIndex = orderedViewControllers.firstIndex(of: currentViewController)!
        let index = tabItems.firstIndex(of: item)!
        
        let direction: NavigationDirection = index > lastIndex ? .forward : .reverse
        
        currentViewController = orderedViewControllers[index]
        
        setViewControllers([currentViewController],
                           direction: direction,
                           animated: true,
                           completion: nil)
        
    }
    
}

extension ViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo: [UIViewController]) {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: willTransitionTo.first!) else {
            return
        }
        
        tabBar2.setSelectedItem(tabItems[viewControllerIndex], animated: true)
        
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        currentViewController = orderedViewControllers[previousIndex]
        return currentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        currentViewController = orderedViewControllers[nextIndex]
        return currentViewController
    }
    
    
}

extension UIImage {
    
    func resized(newSize:CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
