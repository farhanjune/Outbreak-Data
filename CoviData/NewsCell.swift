//
//  NewsCell.swift
//  CovidData
//
//  Created by Farhan Juneja on 8/7/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

  //  @IBOutlet weak var headerTitle: UINavigationBar!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    
    func configureCell( newsTitle: String, newsSource: String) {
    //   self.newsImage.image = newsImage
        self.newsTitle.text = newsTitle
        self.newsSource.text = newsSource
    }
    
}
