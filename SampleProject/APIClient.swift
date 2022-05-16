//
//  APIClient.swift
//  SampleProject
//
//  Created by yusaku maki on 2022/05/16.
//

import Firebase
import FirebaseFirestoreSwift

final class APIClient {
    static var firestore = Firestore.firestore()

    static func fetchFruits() async throws -> [Fruit] {
        try await firestore.collection("fruits")
            .getDocuments()
            .documents
            .compactMap { try $0.data(as: Fruit.self) }
    }

    static func addFruit(_ fruit: Fruit) async throws {
        let ref = try firestore.collection("fruits").addDocument(from: fruit)
        print(ref)
    }
}
