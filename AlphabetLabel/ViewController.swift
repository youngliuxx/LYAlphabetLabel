//
//  ViewController.swift
//  AlphabetLabel
//
//  Created by youngliuxx on 2018/1/3.
//  Copyright © 2018年 youngliuxx. All rights reserved.
//

import UIKit
import LYAlphabetLabel

class ViewController: UIViewController {
    
    let alphabetLabel: LYAlphabetLabel = LYAlphabetLabel.init(frame: CGRect.init(x: 70, y: 100, width: 250, height: 50))
    let alphabetLabel2: LYAlphabetLabel = LYAlphabetLabel.init(frame: CGRect.init(x: 70, y: 300, width: 250, height: 50))
    let alphabetLabel3: LYAlphabetLabel = LYAlphabetLabel.init(frame: CGRect.init(x: 70, y: 450, width: 250, height: 50))
    let textBackgroundColor: UIColor = UIColor.init(red: 229/255, green: 229/255, blue: 229/255, alpha: 1.0)
    let highlightColor: UIColor = UIColor.init(red: 241/255, green: 69/255, blue: 65/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(alphabetLabel)
        view.addSubview(alphabetLabel2)
        view.addSubview(alphabetLabel3)
        
        alphabetLabel.textBackgroundColor = textBackgroundColor
        alphabetLabel.highlightColor = highlightColor
        alphabetLabel.text = "CN";
        
        alphabetLabel2.textBackgroundColor = textBackgroundColor
        alphabetLabel2.highlightColor = highlightColor
        alphabetLabel2.text = "USA";
        
        alphabetLabel3.textBackgroundColor = textBackgroundColor
        alphabetLabel3.highlightColor = highlightColor
        alphabetLabel3.text = "EN";
        alphabetLabel3.isHighlighted = true
    }
}

