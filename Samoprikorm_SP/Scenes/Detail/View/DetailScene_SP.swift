//
//  DetailScene_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import SwiftUI


struct DetailScene_SP: View {
    
//    @ObservedObject var store: Store_SP
    private let card: ProductCard_SP
    private let webViewDelegate: DetailSceneWebViewDelegate_SP
    
    init(card: ProductCard_SP,
         webViewDelegate: DetailSceneWebViewDelegate_SP) {
        self.card = card
        self.webViewDelegate = webViewDelegate
    }
    
    var body: some View {
        DetailSceneWebView_SP(navigationWebDelegate: webViewDelegate,
                              uiWebDelegate: webViewDelegate,
                              urlEndPoint: card.id)
            .edgesIgnoringSafeArea(.bottom)
    }
}



//MARK: - Preview

struct DetailScene_SP_Previews: PreviewProvider {
    
    static var previews: some View {
            DetailSceneConfigurator_SP.configure(card: testCards[0])
    }
}
