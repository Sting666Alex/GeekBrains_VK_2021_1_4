//
//  VKWeb.swift
//  VK_Belov
//
//  Created by Алексей Белов on 13.04.2021.
//

import UIKit
import WebKit
import Alamofire

final class UserSession {
    
    static let shared = UserSession()
    
    private init() {}
    
    var token = ""
    var userID = ""
    var client_id = "7823487"
}

class VKWebScreen: BaseViewController {

    @IBOutlet weak var webview: WKWebView!{
        didSet{
            webview.navigationDelegate = self
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let user = UserSession.shared
        //user.token = ""
        
        autorizationVK()
        
        //firstRequest(id: user.userID, token: user.token)
        
    }
    
    
    func autorizationVK(){
        
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: String(UserSession.shared.client_id)),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                webview.load(request)
    }
    
    func frendsRequest(id:String, token: String){
        
        Alamofire.request("https://api.vk.com/method/friends.get?user_id=" + id + "&fields=name&count=3&v=5.130&access_token=" + token )
            .responseJSON{ responds in
                print(responds.value ?? "")
            }
        
    }
    
    func photosRequest(id:String, token: String){
                
        Alamofire.request("https://api.vk.com/method/photos.get?user_id=" + id + "&album_id=profile&rev=0&count=3&v=5.130&access_token=" + token )
            .responseJSON{ responds in
                print(responds.value ?? "")
            }
        
    }
    
    func groupsRequest(id:String, token: String){
                
        Alamofire.request("https://api.vk.com/method/groups.get?user_id=" + id + "&count=3&v=5.130&access_token=" + token )
            .responseJSON{ responds in
                print(responds.value ?? "")
            }
        
    }
    
    func groupsFilterRequest(id:String, token: String){
                
        Alamofire.request("https://api.vk.com/method/groups.get?user_id=-" + id + "filter=publics,events&count=3&v=5.130&access_token=" + token )
            .responseJSON{ responds in
                print(responds.value ?? "")
            }
        
    }
    
    
}

extension VKWebScreen: WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
            }
            
            let token = params["access_token"]
            let userID = params["user_id"]
            //let expires_in = params["expires_in"] // время его жизни заданное в секунда
            
            //print(token ?? "")
            UserSession.shared.token = token ?? ""
            UserSession.shared.userID = userID ?? ""
            
            frendsRequest(id: String(UserSession.shared.userID), token: String(token ?? ""))
            
            //photosRequest(id: String(UserSession.shared.userID), token: String(token ?? ""))

            //groupsRequest(id: String(UserSession.shared.userID), token: String(token ?? ""))

            //	groupsFilterRequest(id: String(UserSession.shared.userID), token: String(token ?? ""))
            
            decisionHandler(.cancel)
        }
    }
