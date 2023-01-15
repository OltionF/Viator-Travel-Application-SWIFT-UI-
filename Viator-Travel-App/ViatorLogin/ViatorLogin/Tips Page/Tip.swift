//
//  Tip.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//

import Foundation

struct Tip: Decodable{
    let text: String
    let children: [Tip]?
}
