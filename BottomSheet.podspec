Pod::Spec.new do |spec|

  spec.name         = "BottomSheet"
  spec.version      = "0.0.1"
  spec.summary      = "BottomSheet UI Pattern"
  spec.description  = "BottomSheet is a UI pattern component for mobile that displays a view at the bottom of screen."

  spec.homepage     = "https://github.com/ricardoyamaguchi/ui-bottom-sheet"
  spec.license      = "MIT"
  spec.authors            = { "Ricardo Yamaguchi" => "ricardoyamaguchi2011@gmail.com" }
  spec.social_media_url   = "https://github.com/ricardoyamaguchi"

  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/ricardoyamaguchi/ui-bottom-sheet.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
  spec.public_header_files = "Classes/**/*.h"

end
    