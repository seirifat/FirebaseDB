# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
inhibit_all_warnings!

def shared_pods
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxAlamofire'
    
    pod 'RealmSwift' #, '~> 3.1.0'
    pod 'Alamofire' #, '4.7.3'
    pod 'AlamofireImage' #, '4.7.3'
    pod 'SwiftyJSON' #, '~> 3.0.0'
    pod 'ISO8601' #, '~> 0.5.2'
end

target 'FirebaseDB' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    shared_pods
    
    pod 'SwiftLint'
    
    pod 'SwiftDate', '~> 5.0.13'
    pod 'SVProgressHUD'
    pod 'SVPullToRefresh'
    pod 'TPKeyboardAvoiding'
    pod 'ActionSheetPicker-3.0'
    
    pod 'Firebase/Core'
    pod 'Firebase/Database'
    pod 'Firebase/Auth'
    pod 'GoogleSignIn'

    # Pods for FirebaseDB
    
    target 'FirebaseDBTests' do
        inherit! :search_paths
        # Pods for testing
        pod 'SwiftDate', '~> 5.0.13'
    end
    
end
