//
//  StatsViewController.swift
//  CovidData
//
//  Created by Farhan Juneja on 8/9/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import UIKit
import SwiftUI


class StatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBSegueAction func showStat(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: StatView())
    }
    
    
    
}
