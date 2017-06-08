Pod::Spec.new do |s|

  s.name         = "RHWebViewProgress"
  s.version      = "1.0.0"
  s.summary      = "A simple, ornamental, but powerful action sheet! Support: http://www.jianshu.com/u/7c43d8cb3cff"
  s.homepage     = "https://github.com/cochat/RHWebViewProgress"
  s.license      = "MIT"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/cochat/RHWebViewProgress.git", :tag => s.version }
  s.source_files = "Sources/**/*.{h,m}"
  s.requires_arc = true

  s.author           = { "yuhechuan" => "yuhechuan@ruaho.com" }
  s.social_media_url = "http://www.jianshu.com/u/7c43d8cb3cff"              

end