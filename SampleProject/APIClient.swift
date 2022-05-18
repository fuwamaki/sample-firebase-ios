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
        let _ = try firestore.collection("fruits").addDocument(from: fruit)
    }
}

// MARK: addSnapshotListener
extension APIClient {
    static func fetchFruitsListener(completion: @escaping (Result<[Fruit], Error>) -> Void) {
        firestore.collection("fruits").addSnapshotListener { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let querySnapshot = querySnapshot {
                let fruits = querySnapshot.documents
                    .compactMap { try! $0.data(as: Fruit.self) }
                completion(.success(fruits))
            }
        }
    }
}
