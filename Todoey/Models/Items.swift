//
//  Items.swift
//  Todoey
//
//  Created by Sagar Sarkar on 08/03/19.
//  Copyright © 2019 Sagar Sarkar. All rights reserved.
//

import Foundation

class Items:Encodable,Decodable {
    var title :  String = ""
    var done : Bool = false
}
