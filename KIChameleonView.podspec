Pod::Spec.new do |s|
  s.name         = "KIChameleonView"
  s.version      = "0.1.0"
  s.summary      = "The magical image view! Can be a movie, or an anim gif, or normal png, jpgs."
  s.homepage     = "https://github.com/kaiinui/KIChameleonView"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/KIChameleonView.git", :commit => "000ff6ecd70f399878cf9688d0f6203342e4b350" }
  s.source_files  = "ChameleonView/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
  s.dependency "SDWebImage
  s.dependency "VKVideoPlayer"
  s.dependency "FLAnimatedImage"
end
