//
//  ExampleModel.swift
//  WWDC24
//
//  Created by Leo Cheng on 2024/2/16.
//

import Foundation
import SwiftUI

struct ExampleModel: Identifiable {
    var id: String = UUID().uuidString
    var description: String
    var imageName: String
}

func getExamples() -> [ExampleModel] {
    let dog = ExampleModel(description: "A dog lying on the grass lazily.", imageName: "dog")
    let cat = ExampleModel(description: "A cute sitting cat.", imageName: "cat")
    let plane = ExampleModel(description: "A plane flying in the air.", imageName: "lufthansa")
    let train = ExampleModel(description: "A train running on a bridge.", imageName: "train")
    
    return [dog, cat, plane, train]
}
