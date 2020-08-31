//
//  NSAttributedStringExtension.swift
//  OutbreakData
//
//  Created by Farhan Juneja on 8/29/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    
    static func makeHyperlink(for path: String, in string: String, as substring: String) -> NSAttributedString{
        
        
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
        
        
        
    }
    
    
}
