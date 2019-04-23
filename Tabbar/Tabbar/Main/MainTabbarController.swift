//
//  MainTabbarController.swift
//  Tabbar
//
//  Created by wanglei on 2019/4/22.
//  Copyright © 2019年 王磊. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    let mainTabbar = Maintabbar.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        //改变系统默认的蓝色
        self.tabBar.tintColor = UIColor(red: 0/255, green:169/255, blue:169/255, alpha:1)
        self.mainTabbar.pushDelegate = self
        self.setValue(self.mainTabbar, forKey: "tabBar")
        createTabbarFirst()
//        createTabbarSecond()
    }
    // MARK: -第一种常用的tabbar创建方式
    func createTabbarFirst() {
        setupOneChildViewController(title: "更新", image: "icon_update", seletedImage: "icon_update_sel", controller: UpdateVC.init())
        setupOneChildViewController(title: "发现", image: "icon_find", seletedImage: "icon_find_sel", controller: FindVC.init())
        setupOneChildViewController(title: "拍照", image: "photo", seletedImage: "photo_1", controller: PhotoVC.init())
        setupOneChildViewController(title: "书架", image: "icon_book", seletedImage: "icon_book_sel", controller: BookVC.init())
        setupOneChildViewController(title: "我的", image: "icon_mine", seletedImage: "icon_mine_sel", controller: MineVC.init())
    }
    fileprivate func  setupOneChildViewController(title: String,image: String,seletedImage: String,controller: UIViewController){
        controller.tabBarItem.title = title
        controller.title = title
        //这里设置背景色 是每一个vc设置的都一样
        controller.tabBarItem.image = UIImage.init(named: image)
        controller.tabBarItem.selectedImage = UIImage.init(named: seletedImage)
        let naviController = MainNavigationController.init(rootViewController: controller)
        addChild(naviController)
    }
    // MARK: -第二种常用的tabbar创建方式  这个数组可以按对应关系放到info.plist里
    let tabBarNormalImages = ["icon_book","icon_find","icon_update","icon_mine"]
    let tabBarSelectedImages = ["icon_book_sel2x","icon_find_sel2x","icon_update_sel2x","icon_mine_sel2x"]
    let tabBarTitles = ["书架","发现","更新","我的"]
        func createTabbarSecond(){
            var vc : UIViewController?
            for i in 0..<self.tabBarNormalImages.count {
                //创建根控制器
                switch i {
                case 0:
                    vc = BookVC()
                case 1:
                    vc = FindVC()
                case 2:
                    vc = UpdateVC()
                case 3:
                    vc = MineVC()
                default:
                    break
                }
                //创建导航控制器
                let nav = MainNavigationController.init(rootViewController: vc!)
                //1.创建tabbarItem
                let barItem = UITabBarItem.init(title: self.tabBarTitles[i], image: UIImage.init(named: self.tabBarNormalImages[i])?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: self.tabBarSelectedImages[i])?.withRenderingMode(.alwaysOriginal))
                //2.更改字体颜色大小
                barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .normal)
                barItem.setTitleTextAttributes([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 15)], for: .normal)
                barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
                //设置标题
                vc?.title = self.tabBarTitles[i]
                vc?.tabBarItem = barItem
                self.addChild(nav)
            }
        }
}
 //MARK : 中间按钮代理的实现方法
extension MainTabbarController : pushItemDelegate{
    func pushClick() {
        self.present(PhotoVC(), animated: true, completion: nil)
    }
}
