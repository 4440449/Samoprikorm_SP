//
//  DetailSceneWebView_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI
import WebKit



struct DetailSceneWebView_SP: UIViewRepresentable {
    
    private let navigationWebDelegate: WKNavigationDelegate?
    private let uiWebDelegate: WKUIDelegate?
    private let urlEndPoint: String
    
    init(navigationWebDelegate: WKNavigationDelegate?,
         uiWebDelegate: WKUIDelegate?,
         urlEndPoint: String) {
        self.navigationWebDelegate = navigationWebDelegate
        self.uiWebDelegate = uiWebDelegate
        self.urlEndPoint = urlEndPoint
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: CGRect.zero,
                                configuration: configuration)
        webView.navigationDelegate = navigationWebDelegate
        webView.uiDelegate = uiWebDelegate
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
//        webView.backgroundColor = UIColor(named: "background")
//                webView.allowsBackForwardNavigationGestures = true
//                webView.scrollView.isScrollEnabled = true
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        print("https://mterpugova.notion.site/\(urlEndPoint)")
        if let requestUrl = URL(string: "https://mterpugova.notion.site/\(urlEndPoint)") {
//            print(requestUrl)
            webView.load(URLRequest(url: requestUrl))
        }
    }
}




//"https://mterpugova.notion.site/9c9513b81bdf4b6dbdcb7e62c3124d00"
//"https://mterpugova.ru/?go=all/resheno-1-5-goda-ranniy-podem-trudnoe-poslednee-bodrstvovanie/"
