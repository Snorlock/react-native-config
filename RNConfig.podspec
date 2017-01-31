#
#  Be sure to run `pod spec lint ReactNativeConfig.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "RNConfig"
  s.version      = "0.0.27"
  s.summary      = "Bring some 12 factor love to your mobile apps!"
  s.description  = <<-DESC
Bring some 12 factor love to your mobile apps!
This is a NPM module for react native that supports cocoapods to be able to provide env files to controll your different environments for your react app
                   DESC

  s.homepage     = "https://github.com/Snorlock/react-native-config"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author       = { "Snorre Edwin" => "snorre.lothar.von.gohren.edwin@entur.org" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "7.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/Snorlock/react-native-config.git", :tag => "v#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = 'RNConfig/**/*.{swift,h,m}'
  s.resources     = 'RNConfig/**/*.{json}'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.dependency "React"

end
