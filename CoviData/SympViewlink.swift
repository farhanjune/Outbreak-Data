//
//  SympViewlink.swift
//  OutbreakData
//
//  Created by Farhan Juneja on 8/29/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import UIKit


    
    
class SympViewlink: UIViewController {

    
 
    @IBOutlet weak var SympLink: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()

        // Do any additional setup after loading the view.
    }
    
    
    func updateTextView() {
        let path = "https://www.cdc.gov/coronavirus/2019-ncov/index.html"
        let text = SympLink.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "Centers for Disease Control and Prevention")
        let font = SympLink.font
        let textColor = SympLink.textColor
        SympLink.attributedText = attributedString
        SympLink.font = font
        SympLink.textColor = textColor
       
    }

    
    
    
    
    
}
