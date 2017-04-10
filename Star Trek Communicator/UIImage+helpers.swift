//
//  UIImage+helpers.swift
//  Star Trek Communicator
//
//  Created by Blake Clough on 4/8/17.
//  Copyright © 2017 Blake Clough. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
 
