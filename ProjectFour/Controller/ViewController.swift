//
//  ViewController.swift
//  ProjectFour
//
//  Created by Mateus Amorim on 09/09/22.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["hackingwithswift.com", "apple.com", "youtube.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsToToolBar()
        siteAppear()
    }
    
//    func initialPage () {
//        let inital = UIAlertController(title: "Inital Page", message: "What pages do you want to open:", preferredStyle: .actionSheet)
//        for website in websites {
//            inital.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
//        }
//        present(inital, animated: true)
//    }
    
    func siteAppear() {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
         let url = URL(string: "http://" + websites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    }
    
    func buttonsToToolBar() {
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
                                     
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        let progressBar = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [back, progressBar, spacer, refresh, forward]
        
        navigationController?.isToolbarHidden = false
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }

        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "http://" + actionTitle) else {return}
        webView.load(URLRequest(url: url))
    }
    
    func permissionDenied(action: UIAlertAction) {
        guard let url = URL(string: "http://" + websites[0]) else {return}
        webView.load(URLRequest(url: url))
    }
}

extension ViewController: WKNavigationDelegate {
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url

        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        } else {
            let ac = UIAlertController(title: "Permission Denied", message: "You don`t have access a this Website", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: permissionDenied))
            present(ac, animated: true)
            decisionHandler(.cancel)
        }
    }
}

