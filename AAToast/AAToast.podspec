#
#  Be sure to run `pod spec lint AAToast.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "AAToast"
  spec.version      = "1.0.0"
  spec.summary      = "Toast for IOS written in Swift"

  spec.description  = "AAToast is a view containing a quick little message which could be short or long message, shows at the bottom of screen with duration."
  spec.homepage     = "https://github.com/AaoIi/AAToast"
  spec.screenshots  = 'https://camo.githubusercontent.com/f0537a9a5d22383cbf369a2f5e89381519f32db7/68747470733a2f2f6c68352e676f6f676c6575736572636f6e74656e742e636f6d2f515145545a562d496868714466494b66347a442d5763587634496c7a47766c6872744537456839774a4d5370516f42393249315274413d773337332d683634322d702d62312d6330783030393939393939'

  spec.license      = "MIT"

  spec.author             = "Saad Albasha"
  # Or just: spec.author    = "Saad Albasha"

  # spec.platform     = :ios
  spec.platform     = :ios, "8.0"
  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/AaoIi/AAToast.git", :tag => "1.0.0" }

  spec.source_files  = 'AAToast/**/*.swift','AAToast/**/*.h'
  spec.ios.resource_bundle = {
    'AAToast' => ['AAToast/**/*.xib']
  }


end
