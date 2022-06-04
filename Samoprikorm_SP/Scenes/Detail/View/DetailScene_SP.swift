//
//  DetailScene_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import SwiftUI
import UIKit
import WebKit


struct DetailScene_SP: View {
    
    private var store: MainSceneStore_SP
    
    init(store: MainSceneStore_SP) {
        self.store = store
    }
    
    var body: some View {
        DetailSceneWebView_SP(navigationWebDelegate: DetailSceneWebViewDelegate_SP(),
                              uiWebDelegate: nil)
            .edgesIgnoringSafeArea(.bottom)
    }
}



struct DetailScene_SP_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailScene_SP(store: MainSceneStore_SP(initialState: nil,
                                                reducer: MainSceneReducer_SP()))
    }
}



struct DetailSceneWebView_SP: UIViewRepresentable {
    
    private let navigationWebDelegate: WKNavigationDelegate?
    private let uiWebDelegate: WKUIDelegate?
    
    init(navigationWebDelegate: WKNavigationDelegate?,
         uiWebDelegate: WKUIDelegate?) {
        self.navigationWebDelegate = navigationWebDelegate
        self.uiWebDelegate = uiWebDelegate
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: CGRect.zero,
                                configuration: configuration)
        webView.navigationDelegate = navigationWebDelegate
        webView.uiDelegate = uiWebDelegate
        //        webView.allowsBackForwardNavigationGestures = true
        //        webView.scrollView.isScrollEnabled = true
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let requestUrl = URL(string: "https://mterpugova.notion.site/9c9513b81bdf4b6dbdcb7e62c3124d00") {
            webView.load(URLRequest(url: requestUrl))
        }
    }
}



final class DetailSceneWebViewDelegate_SP: NSObject, WKNavigationDelegate {
    
    override init() {
        print("init DetailSceneWebViewDelegate_SP")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        let url = navigationAction.request.url
        if (url != nil && url!.absoluteString.contains("mterpugova")) {
            print ("allow"); return .allow
        } else {
            print ("cancel"); return .cancel
        }
    }
    
    deinit {
        print("deinit DetailSceneWebViewDelegate_SP")
    }
}










//"https://mterpugova.notion.site/9c9513b81bdf4b6dbdcb7e62c3124d00"
//"https://mterpugova.ru/?go=all/resheno-1-5-goda-ranniy-podem-trudnoe-poslednee-bodrstvovanie/"
