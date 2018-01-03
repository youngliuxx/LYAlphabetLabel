//
//  LYAlphabetView.swift
//  LYAlphabetLabel
//
//  Created by youngliuxx on 2018/1/3.
//  Copyright © 2018年 youngliuxx. All rights reserved.
//

import UIKit

let landscapeAmount = 5
let verticalAmount = 7
let dotSpace: CGFloat = 5.0

let defaultTextColor = UIColor.yellow
let defaultBackgroundColor = UIColor.darkGray

class LYAlphabetView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var views: Array<Array<UIView>> = {
        var array = Array<Array<UIView>>.init()
        for i in 0 ..< landscapeAmount {
            var views : Array<UIView> = []
            for j in 0 ..< verticalAmount {
                let view = UIView.init()
                views.append(view)
            }
            array.append(views)
        }
        return array
    }()
    
    public var highlightedColor: UIColor = defaultTextColor {
        didSet {
            updateDot()
        }
    }
    
    public var textBackgroundColor: UIColor = defaultBackgroundColor {
        didSet {
            updateDot()
        }
    }
    
    public var text: Alphabet = .A {
        didSet {
            updateDot()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let dotWH = (self.frame.width - dotSpace*CGFloat(landscapeAmount))/CGFloat(landscapeAmount)
        for i in 0 ..< views.count {
            let viewsArray = views[i]
            for j in 0 ..< viewsArray.count {
                let view = viewsArray[j]
                view.size = CGSize.init(width: dotWH, height: dotWH)
                view.x = CGFloat(i)*dotWH + dotSpace*CGFloat(i)
                view.y = CGFloat(j)*dotWH + dotSpace*CGFloat(j)
                view.layer.cornerRadius = dotWH / CGFloat(2)
                view.layer.masksToBounds = true
                addSubview(view)
            }
        }
    }
    
    private func updateDot() {
        for i in 0 ..< views.count {
            let viewsArray = views[i]
            for j in 0 ..< viewsArray.count {
                let view = viewsArray[j]
                view.backgroundColor = isHighLight(landscape: i, vertical: j) ? highlightedColor : textBackgroundColor
            }
        }
    }
    
    fileprivate func isHighLight(landscape: Int, vertical: Int) -> Bool {
        let array = text.index()
        if array[vertical][landscape] == 1 {
            return true
        }
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
}
