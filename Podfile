use_frameworks!

target 'AuthSample_Example' do

pod 'Alamofire'
pod 'ILLoginKit'
pod 'ImageSlideshow', '~> 1.5'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
    end
  end
end
