platform :ios, '9.0'
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'


target 'GCM-App' do
    pod 'Firebase/Core'
    pod 'Firebase/Messaging'
    pod 'Alamofire', '~> 4.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
