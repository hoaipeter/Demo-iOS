//
//  WebViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    private var rssItem : RSSModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func initWithUrl(stringUrl:RSSModel) {
        self.rssItem = stringUrl
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let myURL = URL(string: (rssItem?.link)!)!
        let myRequest = URLRequest(url: myURL)
        webView.loadRequest(myRequest)
        webView.delegate = self
    }
    
}
extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Start Load web")
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("Make request with URL ",request)
        return true
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){}
}
