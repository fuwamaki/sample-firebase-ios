//
//  AppendView.swift
//  SampleProject
//
//  Created by yusaku maki on 2022/05/17.
//

import SwiftUI

struct AppendView: View {
    @Binding var isPresented: Bool
    @State var isLoading: Bool = false
    @State private var name: String = ""
    @State private var starCount: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 8.0)
                    TextField("Star Count", text: $starCount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding(.vertical, 8.0)
                    Button {
                        Task {
                            do {
                                isLoading.toggle()
                                try await APIClient.addFruit(Fruit(
                                    name: name,
                                    starCount: Int(starCount)!
                                ))
                                isLoading.toggle()
                                isPresented.toggle()
                            } catch let error {
                                debugPrint(error.localizedDescription)
                            }
                        }
                    } label: {
                        Text("Append")
                            .frame(maxWidth: .infinity)
                            .padding(.all, 8)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(8.0)
                    }
                    .padding(.vertical, 8.0)
                }
                .padding()
                if isLoading {
                    ProgressView()
                        .tint(.blue)
                }
            }
            .navigationTitle("Append")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct AppendView_Previews: PreviewProvider {
    static var previews: some View {
        AppendView(isPresented: .constant(true))
    }
}
