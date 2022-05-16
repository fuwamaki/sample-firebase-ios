//
//  ContentView.swift
//  SampleProject
//
//  Created by yusaku maki on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [Fruit] = []

    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                Text(fruit.name)
            }
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            do {
                                let entity = Fruit(
                                    id: nil,
                                    name: "apple",
                                    starCount: 204
                                )
                                try await APIClient.addFruit(entity)
                            } catch let error {
                                debugPrint(error.localizedDescription)
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .task {
            do {
                fruits = try await APIClient.fetchFruits()
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
