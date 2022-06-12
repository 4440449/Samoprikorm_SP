//
//  ContentView.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//
//

import SwiftUI
import Foundation


struct MainSceneView: View {
    
    init(store: Store_SP,
         actionPool: ActionPool_SP) {
        self.store = store
        self.actionPool = actionPool
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Black", size: 38)!]
        actionPool.dispatch(params: .initialLoading)
        print("MainSceneView INIT")
    }
    
    //MARK: - Dependencies
    @ObservedObject var actionPool: ActionPool_SP
    @ObservedObject var store: Store_SP
    
    //MARK: - State
    @State private var txtField = ""
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(UIColor(red: 0.922, green: 0.929, blue: 0.957, alpha: 1)).ignoresSafeArea(.all, edges: .all)
                ScrollView {
                    ZStack {
                        if store.state.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(1.3)
                                .frame(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height * 0.7,
                                       alignment: .center)
                        }
                        VStack {
                            ForEach(store.state.cards.filter({
                                $0.title.contains(store.state.searchFieldText.capitalized)
                                ||
                                store.state.searchFieldText.isEmpty
                            })) { card in
                                NavigationLink (destination: {
                                    DetailSceneConfigurator_SP.configure(store: store)
                                        .onAppear { // ???
                                            actionPool.dispatch(params: .select(card))
                                        }
                                }, label: {
                                    CardView(product: card, actionPool: actionPool)
                                })
                                    .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.bottom, 10)
                        }
                    }
                }
                .navigationTitle("Продукты")
                .foregroundColor(.black)
            }
        }
        .navigationViewStyle(.stack)
        .searchable(text: $txtField,
                    placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: txtField,
                  perform: { newTxt in
            actionPool.dispatch(params: .search(newTxt))
        })
    }
}



struct CardView: View {
    
    //MARK: - Dependencies
    private let productCard: ProductCard_SP
    private let actionPool: ActionPool_SP
    
    //MARK: - Init
    
    init(product: ProductCard_SP,
         actionPool: ActionPool_SP) {
        self.productCard = product
        self.actionPool = actionPool
        print("CardView INIT \(product.title)")
        //            actionPool.dispatch(params: .imageLoading(product))
        if (product.image != nil || product.imageIsLoading == true) {
            return
        } else {
            print("imageLoading")
            actionPool.dispatch(params: .imageLoading(product))
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ZStack {
                    Image(uiImage: productCard.image ?? UIImage())
                        .resizable()
                    if productCard.imageIsLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(1.3)
                    }
                }
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
        //        .onAppear {
        //            actionPool.dispatch(params: .imageLoading(productCard))
        //        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneConfigurator_SP.configure(store: storeGlobal,
                                           actionPool: actionPool)
        //        MainSceneView(store: Store_SP(initialState: nil,
        //                                      reducer: Reducer_SP()),
        //                                      actionPool: <#ActionPool#>)
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
