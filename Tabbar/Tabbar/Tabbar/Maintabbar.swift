//
//  Maintabbar.swift
//  Tabbar
//
//  Created by boyka on 2019/4/23.
//  Copyright © 2019年 王磊. All rights reserved.
//
import UIKit
/// 上传按钮点击代理
protocol pushItemDelegate:NSObjectProtocol {
    func pushClick()
}
class Maintabbar: UITabBar {
    weak var pushDelegate: pushItemDelegate?
    var pushItem : UIButton?
    //初始化:对tabbar进行想要的自定义设置
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.barTintColor = UIColor.gray
        //是否为半透明状态
        self.isTranslucent = false
        //对中间的按钮进行设置
        self.pushItem = UIButton.init(type: .custom)
        //选择时高亮
        pushItem?.adjustsImageWhenHighlighted = false
        pushItem?.setBackgroundImage(UIImage.init(named: "haha"), for: .normal)
        pushItem?.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        self.addSubview(pushItem!)
    }
    //layoutSubviews:里设置中间的发布按钮
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemWidth = UIScreen.main.bounds.size.width/5
        var index :Int = 0
        for childButton in self.subviews {
            if childButton.isKind(of: NSClassFromString("UITabBarButton")!){
                childButton.frame = CGRect.init(x: itemWidth * CGFloat(index), y: 0, width: itemWidth, height: self.frame.size.height)
                index += 1
                //中间的做特殊处理
                if index == 2{
                    let middleItemX = itemWidth * CGFloat(index)
                    let middleItemY = -(itemWidth/CGFloat(2))
                    self.pushItem?.frame = CGRect.init(x: middleItemX, y: middleItemY, width: CGFloat((self.pushItem?.currentBackgroundImage?.size.width)!), height: CGFloat((self.pushItem?.currentBackgroundImage?.size.height)!))
                    //这个center定位按钮的位置 是超出tabbar 还是在tabbar里面显示
                    self.pushItem?.center = CGPoint.init(x: self.center.x, y: self.frame.size.height/2-20)
                    index += 1
                }
            }
        }
        self.bringSubviewToFront(self.pushItem!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 重写hitTest方法，监听按钮的点击 让凸出tabbar的部分响应点击
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /// 判断是否为根控制器
        if self.isHidden {
            /// tabbar隐藏 不在主页 系统处理
            return super.hitTest(point, with: event)
        }else{
            /// 将单钱触摸点转换到按钮上生成新的点
            let tempPoint = self.convert(point, to: self.pushItem)
            /// 判断新的点是否在按钮上
            if (self.pushItem!.point(inside: tempPoint, with: event)){
                return self.pushItem
            }else{
                /// 不在按钮上 系统处理
                return super.hitTest(point, with: event)
            }
        }
    }
    @objc func pushAction(){
        if pushDelegate != nil{
            pushDelegate?.pushClick()
        }
    }
  
    }
