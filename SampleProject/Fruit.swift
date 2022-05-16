//
//  Fruit.swift
//  SampleProject
//
//  Created by yusaku maki on 2022/05/17.
//

import Foundation
import FirebaseFirestoreSwift

struct Fruit: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var starCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case starCount = "star_count"
    }
}
