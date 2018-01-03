//
//  LYAlphabetLabel.swift
//  LYAlphabetLabel
//
//  Created by youngliuxx on 2018/1/3.
//  Copyright © 2018年 youngliuxx. All rights reserved.
//

import UIKit

public class LYAlphabetLabel: UIView {
    public var textBackgroundColor: UIColor = UIColor.white {
        didSet{
            updateAlphabetViews()
        }
    }
    
    public var highlightColor: UIColor = UIColor.black {
        didSet{
            updateAlphabetViews()
        }
    }
    
    public var text: String = "" {
        didSet {
            self.updateText()
        }
    }
    
    public var isHighlighted: Bool = false {
        didSet {
            updateAlphabetViews()
        }
    }
    
    private var alphabetViews: Array<LYAlphabetView> = []
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let space: CGFloat = 10.0
        let alphabetWidth = (frame.size.width-CGFloat(3.0)*space) / CGFloat(alphabetViews.count)
        for i in 0..<alphabetViews.count {
            let alphabetView = alphabetViews[i]
            alphabetView.frame = CGRect.init(x: CGFloat(i)*alphabetWidth + CGFloat(i)*space, y: 0, width: alphabetWidth, height: frame.size.height)
        }
    }
    
    func updateAlphabetViews() {
        for i in 0..<alphabetViews.count {
            let alphabetView = alphabetViews[i]
            alphabetView.highlightedColor = highlightColor
            alphabetView.textBackgroundColor = textBackgroundColor
            if isHighlighted {
                alphabetView.text = .highlighted
                alphabetView.textBackgroundColor = UIColor.clear
            }
            else {
                updateText()
            }
        }
    }
    
    func updateText() {
        for view in alphabetViews {
            view.removeFromSuperview()
        }
        alphabetViews.removeAll()
        for i in 0..<text.count {
            let startIndex = text.index(text.startIndex, offsetBy: i)
            let endIndex = text.index(startIndex, offsetBy: 1)
            let subStr = text[startIndex..<endIndex]
            let alphabetView = LYAlphabetView.init()
            alphabetView.text = Alphabet(rawValue: String(subStr))!
            alphabetView.highlightedColor = highlightColor
            alphabetView.textBackgroundColor = textBackgroundColor
            addSubview(alphabetView)
            alphabetViews.append(alphabetView)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

