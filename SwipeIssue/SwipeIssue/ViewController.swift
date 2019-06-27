//
//  ViewController.swift
//  SwipeIssue
//
//  Created by Johnnykutty Mathew on 27.06.19.
//  Copyright © 2019 Johnnykutty Mathew. All rights reserved.
//

import UIKit
import Flutter
class ViewController: UIViewController {

    var flutterViewController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flutterViewController = FlutterViewController()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? UIPageViewController {
            pageViewController.dataSource = self
            let tablevieController = controllerWith(prefix: "First")
            pageViewController.setViewControllers([tablevieController], direction: .forward, animated: true)
        }
    }
    
    func controllerWith(prefix: String) -> UIViewController {
        let tablevieController = self.storyboard!.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        tablevieController.prefix = prefix
        return tablevieController
    }

}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let tableViewController = viewController as? TableViewController {
            if tableViewController.prefix == "Second" {
                return controllerWith(prefix: "First")
            }
            if tableViewController.prefix == "First" {

                return flutterViewController
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let tableViewController = viewController as? TableViewController {
            if tableViewController.prefix == "First" {
                return controllerWith(prefix: "Second")
            }
        }
        if viewController is FlutterViewController {
            return controllerWith(prefix: "First")
        }
        return nil

    }
}
