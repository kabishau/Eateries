//
//  WebViewController.swift
//  Eateries
//
//  Created by user131656 on 11/11/17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var url: URL!
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let request = URLRequest(url: url)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true

    }

}
