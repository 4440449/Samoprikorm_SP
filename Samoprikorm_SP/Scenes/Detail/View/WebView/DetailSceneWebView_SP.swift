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
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        print("https://mterpugova.notion.site/\(urlEndPoint)")
        if let requestUrl = URL(string: "https://mterpugova.notion.site/\(urlEndPoint)") {
            webView.load(URLRequest(url: requestUrl))
        }
    }
}
