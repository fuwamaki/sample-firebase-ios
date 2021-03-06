//
//  Fruit.swift
//  SampleProject
//
//  Created by fuwamaki on 2022/05/17.
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

    init(id: String? = nil, name: String, starCount: Int) {
        self.id = id
        self.name = name
        self.starCount = starCount
    }
}
