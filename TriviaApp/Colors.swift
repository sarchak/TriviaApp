//
//  Colors.swift
//  TriviaApp
//
//  Created by Shrikar Archak on 9/25/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    
    let colors = [
        UIColor(red: 121/255.0, green: 164/255.0, blue: 91/255.0, alpha: 1.0),
        UIColor(red: 92/255.0, green: 138/255.0, blue: 139/255.0, alpha: 1.0),
        UIColor(red: 128/255.0, green: 107/255.0, blue: 76/255.0, alpha: 1.0),
        UIColor(red: 121/255.0, green: 92/255.0, blue: 139/255.0, alpha: 1.0),
        UIColor(red: 147/255.0, green: 182/255.0, blue: 59/255.0, alpha: 1.0)
    ]
    
    func randomColor() -> UIColor {
        let index = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[index]
    }
}