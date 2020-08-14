//
//  ViewController.swift
//  CovidData
//
//  Created by Farhan Juneja on 8/4/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var time = Timer()
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var currentDate: UILabel!
    
    @IBOutlet weak var copyright: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.DateandTime), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func DateandTime () {
        let time = DateFormatter()
        let date = DateFormatter()
        
        time.timeStyle = .medium
        date.dateStyle = .medium
        
        currentTime.text = time.string(from: Date())
        currentDate.text = date.string(from: Date())
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
   
    
}

