//
//  Constants.swift
//  Star Trek Communicator
//
//  Created by Blake Clough on 4/8/17.
//  Copyright © 2017 Blake Clough. All rights reserved.
//

import Foundation
import UIKit

let kFirebaseUrl = "https://star-trek-communicator.firebaseio.com/"


struct AppColor {
    static let base = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
    static let light =  UIColor(red: 139/255, green: 162/255, blue: 206/255, alpha: 1)
    static let medium = UIColor(red: 91/255, green: 119/255, blue: 173/255, alpha: 1)
    static let dark = UIColor(red: 36/255, green: 70/255, blue: 137/255, alpha: 1)
    static let darkest = UIColor(red: 21/255, green: 50/255, blue: 107/255, alpha: 1)
}

enum MyColor: UIColor {
    case base(UIColor)
}
