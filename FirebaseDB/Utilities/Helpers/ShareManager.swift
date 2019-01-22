//
//  ShareManager.swift
//
//  Created by Muhammad Alam Akbar on 3/23/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseDynamicLinks
import SVProgressHUD

class ShareManager {

//    public static let customAllowedSet =  NSCharacterSet(charactersIn:"&=\"#%/<>?@\\^`{|}").inverted
//    
//    public static func generateDeeplink(_ link: String) -> String {
//        let dynamicLink = "https://rkpw9.app.goo.gl/?link=\(link)&apn=com.baliutd.android&afl=\(link)&ifl=\(link)"
////        print("generateDeeplink \(dynamicLink)")
//        return dynamicLink
//    }
//    
//    public static func generateDeeplink(withNewsSlag slag: String, id: Int64) -> String {
//        let link = "http://www.baliutd.com/news/\(slag)/\(id)"
//        let dynamicLink = "https://rkpw9.app.goo.gl/?link=\(link)&apn=com.baliutd.android&afl=\(link)&ifl=\(link)"
////        print("generateDeeplinkwithNewsSlag \(dynamicLink)")
//        return dynamicLink
//    }
//    
//    public static func performShare(viewController: UIViewController, wording: String) {
//        let items = [
//            wording
//        ]
//        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        controller.excludedActivityTypes = [UIActivityType.assignToContact, UIActivityType.copyToPasteboard, UIActivityType.postToWeibo, UIActivityType.print]
//        
//        if controller.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
//            // iOS8+
//            viewController.present(controller, animated: true, completion: nil)
//            controller.popoverPresentationController?.sourceView = viewController.view
//        } else {
//            viewController.present(controller, animated: true, completion: nil)
//        }
//    }
//    
//    public static func firebaseNewsShare(news: News, completion: @escaping DynamicLinkShortenerCompletion) {
//        let type = "news"
//        guard let link = URL(string: "\(SuitmobileCore.baseurl)/\(type)/\(news.identifier)") else { return }
//        let dynamicLinksDomain = "bolanusantara.page.link"
//        let linkBuilder = DynamicLinkComponents(link: link, domain: dynamicLinksDomain)
//        
//        linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: "com.bolanusantara.ios")
//        linkBuilder.iOSParameters?.fallbackURL = URL(string: "\(SuitmobileCore.baseurl)/\(type)/\(news.slug ?? "")")
//        
//        linkBuilder.androidParameters = DynamicLinkAndroidParameters(packageName: "com.bolanusantara")
//        linkBuilder.androidParameters?.fallbackURL = URL(string: "\(SuitmobileCore.baseurl)/\(type)/\(news.slug ?? "")")
//        
//        linkBuilder.otherPlatformParameters = DynamicLinkOtherPlatformParameters()
//        linkBuilder.otherPlatformParameters?.fallbackUrl = URL(string: "\(SuitmobileCore.baseurl)/\(type)/\(news.slug ?? "")")
//        
//        linkBuilder.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
//        linkBuilder.socialMetaTagParameters?.title = news.title ?? ""
//        linkBuilder.socialMetaTagParameters?.descriptionText = "Open in Bola Nusantara App"
//        linkBuilder.socialMetaTagParameters?.imageURL = URL(string: news.imageSmallCover ?? "")
//        
//        guard let longDynamicLink = linkBuilder.url else { return }
//        print("The long URL is: \(longDynamicLink)")
//        
//        linkBuilder.options = DynamicLinkComponentsOptions()
//        linkBuilder.options?.pathLength = .short
//        linkBuilder.shorten() { url, warnings, error in
//            print(warnings ?? "")
//            print(url ?? "")
//            completion(url, warnings, error)
//        }
//    }
    
}
