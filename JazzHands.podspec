Pod::Spec.new do |s|
  s.name         = 'JazzHands'
  s.version      = '2.0.1'
  s.summary      = 'Simple keyframe animations for scrolling intros.'
  s.homepage     = 'https://github.com/IFTTT/JazzHands'
  s.author       = { 
                     'Devin Foley' => 'devin@ifttt.com',
                     'Jonathan Hersh' => 'jonathan@ifttt.com',
                     'Max Meyers' => 'max@ifttt.com',
                     'Laura Skelton' => 'laura@ifttt.com' 
                   }
  s.source       = { :git => 'https://github.com/IFTTT/JazzHands.git', :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  s.frameworks   = 'Foundation', 'UIKit', 'CoreGraphics', 'QuartzCore'
  s.source_files = 'JazzHands/*.{h,m}'
  s.description  = "Jazz Hands is a keyframe animation framework by IFTTT. Move UIViews around the screen based on UIScrollView input, KVO, or anything really."
  s.social_media_url = 'https://twitter.com/ifttt'
  s.compiler_flags = "-fmodules"
end
