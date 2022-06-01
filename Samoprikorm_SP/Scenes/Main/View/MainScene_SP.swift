//
//  ContentView.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//
//


import SwiftUI
//import Combine

struct MainSceneView: View {

    @State private var searchFieldTxt = ""
    @ObservedObject var store: MainSceneStore_SP

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    TextField("Искать продукт", text: $searchFieldTxt)
                        .font(.body)
                        .padding([.leading, .trailing, .bottom, .top], 10)
//                        .padding(.top, 20)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.3),
                                radius: 7,
                                x: 0,
                                y: 0)
//                        .padding(.init(top: 5, leading: 10, bottom: 0, trailing: 10))
                }
                .padding(.init(top: 5, leading: 10, bottom: 0, trailing: 10))
                .background(.gray)
                .navigationTitle("Продукты")
                .navigationBarTitleDisplayMode(.large)
            }
            .background(.green)
        }
        
    }
}


//struct CardView: View {
//    @State var image: Image?
//    @State var month: String
//    @State var allergen: String
//    @State var benefit: String
//
//    var body: some View {
//        VStack {
//            Image(systemName: "")
//            VStack {
//                Text("Product name")
//                HStack {
//                    VStack {
//                        Text("6+")
//                        Text("month")
//                    }
//                    VStack {
//                        Text("No")
//                        Text("allergen")
//                    }
//                    VStack {
//                        Text("smile")
//                        Text("profit")
//                    }
//                }
//            }
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainSceneView(store: <#T##MainSceneStore_SP#>)
//    }
//}
