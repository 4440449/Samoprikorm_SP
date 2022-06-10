//
//  DetailScene_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import SwiftUI


struct DetailScene_SP: View {
    
    @ObservedObject var store: Store_SP
    private let webViewDelegate: DetailSceneWebViewDelegate_SP
    
    init(store: Store_SP,
         webViewDelegate: DetailSceneWebViewDelegate_SP) {
        self.store = store
        self.webViewDelegate = webViewDelegate
    }
    
    var body: some View {
        DetailSceneWebView_SP(navigationWebDelegate: webViewDelegate,
                              uiWebDelegate: webViewDelegate,
                              urlEndPoint: store.state.selectedCard?.id ?? "Полный УРЛ страницы с ошибкой")
            .edgesIgnoringSafeArea(.bottom)
    }
}



//MARK: - Preview

struct DetailScene_SP_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailSceneConfigurator_SP.configure(store: storeGlobal)
    }
}
