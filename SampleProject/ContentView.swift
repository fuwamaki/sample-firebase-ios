//
//  ContentView.swift
//  SampleProject
//
//  Created by fuwamaki on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [Fruit] = []
    @State var isLoading: Bool = false
    @State var isPresented: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                List(fruits) { fruit in
                    HStack {
                        Text(fruit.name)
                        Spacer()
                        HStack {
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                            Text(String(fruit.starCount))
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 8.0)
                    }
                }
                if isLoading {
                    ProgressView()
                        .tint(.blue)
                }
            }
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear(perform: {
            fetch()
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            fetch()
        }, content: {
            AppendView(isPresented: $isPresented)
        })
    }

    private func fetch() {
        Task {
            do {
                isLoading.toggle()
                fruits = try await APIClient.fetchFruits()
                isLoading.toggle()
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
