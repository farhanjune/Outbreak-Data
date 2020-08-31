//
//  SympViewlink.swift
//  OutbreakData
//
//  Created by Farhan Juneja on 8/29/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import UIKit


    
    
class HelpViewlink: UIViewController {

    
 
    
    @IBOutlet weak var HelpLink: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()

        // Do any additional setup after loading the view.
    }
    
    
    func updateTextView() {
        let path = "https://www.cdc.gov/coronavirus/2019-ncov/index.html"
        let text = HelpLink.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "Centers for Disease Control and Prevention")
        let font = HelpLink.font
        let textColor = HelpLink.textColor
        HelpLink.attributedText = attributedString
        HelpLink.font = font
        HelpLink.textColor = textColor
       
    }

    
    
    
    
    
}
