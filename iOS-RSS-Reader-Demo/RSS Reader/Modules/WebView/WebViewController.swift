//
//  WebViewController.swift
//  RSS Reader
//
//  Created by Hoai Ho on 29/07/2018.
//  Copyright © 2018 Hoai Ho. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var rssItem : RSSModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let myURL = URL(string: (rssItem?.link)!)!
        let myRequest = URLRequest(url: myURL)
        webView.loadRequest(myRequest)
    }
    
}
