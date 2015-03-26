Pod::Spec.new do |s|
  s.name             = "BMDrawRectView"
  s.version          = "1.5.0"
  s.summary          = "A UIView subclass with a hot-swappable block for the drawRect method"
  s.description      = <<-DESC
                       A UIView subclass with a hot-swappable block for the drawRect method. Custom drawRect code without extra subclassing!
                       DESC
  s.homepage         = "https://github.com/iosengineer/BMDrawRectView"
  s.license          = 'MIT'
  s.author           = { "Adam Iredale" => "@iosengineer" }
  s.source           = { :git => "https://github.com/iosengineer/BMDrawRectView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iosengineer'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.frameworks = 'UIKit'
end
