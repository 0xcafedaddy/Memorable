# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def rx_swift
    pod 'RxSwift', '~> 4.0'
end

def rx_cocoa
    pod 'RxCocoa', '~> 4.0'
end

def test_pods
    pod 'RxTest', '~> 4.0'
    pod 'RxBlocking', '~> 4.0'
    pod 'Nimble'
end


target 'Memorable' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_cocoa
  rx_swift
  pod 'QueryKit'
  pod 'FoldingCell'
  target 'MemorableTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift

  target 'DomainTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'NetworkPlatform' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'

    target 'NetworkPlatformTests' do
        inherit! :search_paths
        test_pods
    end
    
end

target 'RealmPlatform' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'RxRealm'
  pod 'QueryKit'
  pod 'RealmSwift'
  pod 'Realm'

  target 'RealmPlatformTests' do
    inherit! :search_paths
    test_pods
  end

end
