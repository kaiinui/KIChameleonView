Pod::Spec.new do |s|
  s.name         = "KIChameleonView"
  s.version      = "0.1.0"
  s.summary      = "The magical image view! Can be a movie, or an anim gif, or normal png, jpgs."
  s.homepage     = "https://github.com/kaiinui/KIChameleonView"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/KIChameleonView.git", :tag => "v0.1.0" }
  s.source_files  = "Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
