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
    
    init(store: Store_SP) {
        self.store = store
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Black", size: 38)!]
    }
    
    //MARK: - Dependencies
    @ObservedObject var store: Store_SP
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
//                    store.state.searchFieldText
                    ForEach(store.state.cards.filter({ $0.title.contains(store.state.searchFieldText.capitalized)
                        ||
                        store.state.searchFieldText.isEmpty })) { card in
                            NavigationLink (destination: {
                                DetailSceneConfigurator_SP.configure()
                                    .onAppear {
                                        store.dispatch(action: .select(card: card))
                                    }
                            }, label: {
                                CardView(productCard: card)
                            })
                                .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.bottom, 10)
                }
            }
            .navigationTitle("Продукты")
            .background (Color.init(UIColor(red: 0.922, green: 0.929, blue: 0.957, alpha: 1)).ignoresSafeArea(.all, edges: .all))
            .foregroundColor(.black)
        }
        .searchable(text: $store.state.searchFieldText,
                    placement: .navigationBarDrawer(displayMode: .always))
        .navigationViewStyle(.stack)
    }
}



struct CardView: View {
    
    //MARK: - Dependencies
    var productCard: ProductCard
    
    //MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(productCard.imagePath, bundle: nil)
                    .resizable()
                VStack(alignment: .leading, spacing: 5) {
                    Text(productCard.title)
                        .title()
                    HStack(spacing: 40) {
                        VStack(alignment: .leading) {
                            Text(productCard.age)
                                .title2()
                            Text("months")
                                .callout()
                        }
                        VStack(alignment: .leading) {
                            Text(productCard.allergen)
                                .title2()
                            Text("allergen")
                                .callout()
                        }
                        VStack(alignment: .leading) {
                            Text(productCard.rating)
                                .title2()
                            Text("benefit")
                                .callout()
                        }
                    }
                }
                .padding(.init(top: 5, leading: 15, bottom: 20, trailing: 0))
            }
            .background(Color(.sRGB, red: 246, green: 247, blue: 250, opacity: 1))
            .cornerRadius(12)
            .padding(.all, 1)
        }
        .frame(height: 409)
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .shadow(color: Color.gray.opacity(0.13), radius: 5, x: 0, y: 8)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView(store: Store_SP(initialState: nil,
                                               reducer: Reducer_SP()))
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
