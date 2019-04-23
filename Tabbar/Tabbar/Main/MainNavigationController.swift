//
//  MainNavigationController.swift
//  YYQ-Swift
//
//  Created by boyka on 2019/4/22.
//  Copyright © 2019年 王磊. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // 设置naviBar背景图片
//       UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), for: UIBarMetrics.default)
            // 设置title的字体
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)]
//            self.interactivePopGestureRecognizer?.delegate = nil
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
//        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//            print(self.viewControllers.count)
//            if self.viewControllers.count < 1 {
//        viewController.navigationItem.rightBarButtonItem = setRightButton()
//            }else{
//                viewController.hidesBottomBarWhenPushed = true
//                viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
//            }
//            super.pushViewController(viewController, animated: true)
//        }
    
//        func setRightButton() -> UIBarButtonItem {
//            let searchItem = UIButton.init(type: UIButton.ButtonType.custom)
//            searchItem.setImage(UIImage.init(named: "searchbutton_nor"), for: UIControl.State.normal)
//            searchItem.sizeToFit()
//            searchItem.frame.size = CGSize.init(width: 30, height: 30)
//            searchItem.contentHorizontalAlignment = .right
//            searchItem.addTarget(self, action: #selector(searchClick), for: UIControl.Event.touchUpInside)
//            return UIBarButtonItem.init(customView: searchItem)
//        }
//        func setBackBarButtonItem() -> UIBarButtonItem {
//            let backButton = UIButton.init(type: UIButton.ButtonType.custom)
//            backButton.setImage(UIImage.init(named: "setting_back"), for: UIControl.State.normal)
//            backButton.sizeToFit()
//            backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            backButton.addTarget(self, action: #selector(backClick), for: UIControl.Event.touchUpInside)
//            return UIBarButtonItem.init(customView: backButton)
//        }
//        /// 返回
//    @objc func backClick() {
//            self.popViewController(animated: true)
//        }
//        /// 点击右边的搜索
//    @objc func searchClick() {
//            //        let searchvc = SearchVC()
//            //        self.pushViewController(searchvc, animated: true)
//        }
}
