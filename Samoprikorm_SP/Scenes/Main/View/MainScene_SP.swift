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
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Отмена"

        actionPool.dispatch(params: .initialLoading)
        print("MainSceneView INIT")
    }
    
    //MARK: - Dependencies
    @ObservedObject var actionPool: ActionPool_SP
    @ObservedObject var store: Store_SP
    
    //MARK: - State
    @State private var txtField = ""
    @State private var isDisplayingErrorAlert = false
    
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color("background", bundle: nil)
                    .ignoresSafeArea(.all, edges: .all)
                ScrollView {
                    ZStack {
                        Color.clear
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height * 0.2,
                                   alignment: .center)
                        if store.state.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(1.3)
                        }
                        VStack {
                            ForEach(store.state.cards.filter({
                                $0.title.contains(store.state.searchFieldText.capitalized)
                                ||
                                store.state.searchFieldText.isEmpty
                            })) { card in
                                NavigationLink (destination: {
                                    DetailSceneConfigurator_SP.configure(card: card)
                                }, label: {
                                    CardView(product: card, actionPool: actionPool)
                                })
                                    .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.bottom, 10)
                        }
                    }
                }
            }
            .navigationTitle("Продукты")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $txtField,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Поиск")
        .onChange(of: txtField,
                  perform: { newTxt in
            actionPool.dispatch(params: .search(newTxt))
        })
        .alert(isPresented: $isDisplayingErrorAlert) {
            Alert(title: Text("Ошибка"),
                  message: Text(store.state.errorMessage),
                  dismissButton: .cancel(Text("Отмена")))
        }
        .onSubmit {
            print("onSubmit")
        }
        .onAppear {
            print("onAppear")
        }
        .onChange(of: store.state.errorMessage) { newValue in
            print("onChange")
            self.isDisplayingErrorAlert = true
        }
        .onHover { bol in
            print("onHover some bol --> \(bol)")
        }
        
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
        //        print("CardView INIT \(product.title)")
        actionPool.dispatch(params: .imageLoading(product))
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                //                Image(productCard.imagePath!, bundle: nil)
                //                    .resizable()
                ZStack {
                    Image(uiImage: productCard.image ?? UIImage())
                        .resizable()
                    if productCard.imageIsLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(1.3)
                    }
                }
                HStack {
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
                    .padding(.init(top: 13, leading: 16, bottom: 20, trailing: 0))
                    Spacer()
                }
                .background(Color("cardFill2", bundle: nil))
            }
            .cornerRadius(14)
        }
        //        .frame(height: 409)
        .frame(height: UIScreen.main.bounds.height * 0.485)
        .padding(.all, 2)
        .background(Color("cardBorderSystemColor2", bundle: nil))
        .cornerRadius(15)
        .padding(.horizontal, 16)
        .shadow(color: Color("cardShadowUp", bundle: nil),
                radius: 6, x: -3, y: -7)
        .shadow(color: Color("cardShadowDown", bundle: nil),
                radius: 6, x: 5, y: 5)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneConfigurator_SP.configure(store: testStore,
                                           actionPool: actionPool)
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
