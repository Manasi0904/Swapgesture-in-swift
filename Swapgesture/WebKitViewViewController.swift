//
//  WebKitViewViewController.swift
//  Swapgesture
//
//  Created by Kumari Mansi on 15/01/25.
//

import UIKit
import WebKit

class WebKitViewViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "http://www.apple.com"
        let request = URLRequest(url: URL(string: urlString)!)
        self.webView.load(request)
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
            if keyPath == "loading"
            {
                if self.webView.isLoading {
                    self.activityIndicator.startAnimating()
                    self.activityIndicator.isHidden = false
                }
                else {
                    self.activityIndicator.stopAnimating()
                }
            }

    }
    
   
    @IBAction func button(_ sender: Any) {
    
    
 let Storyboard = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
 self.navigationController?.pushViewController(Storyboard, animated: true)
}

}
