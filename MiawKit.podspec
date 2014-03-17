Pod::Spec.new do |s|
  s.name              = 'MiawKit'
  s.version           = '1.0'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.summary           = 'A set of utilities that gives localization in Objective-C a little more miaw'
  s.homepage          = 'https://github.com/robocat/MiawKit'
  s.authors           = { 'Robocat' => 'hello@robo.cat' }
  s.source            = { :git => 'https://github.com/robocat/MiawKit.git', :branch => 'master' }
  s.social_media_url  = 'http://twitter.com/robocat'
  s.screenshot        = "http://cl.ly/image/0K1x1L0F2p1C/Bh-2X4RIUAEovzh.png"

  s.requires_arc      = true

  s.source_files      = 'MiawKit/*.{h,m}'
  
  s.ios.deployment_target   = '6.0'
  s.osx.deployment_target   = '10.7'

  s.ios.source_files        = 'MiawKit/UIKit+MKLocalization/*.{h,m}'
  s.osx.source_files        = 'MiawKit/AppKit+MKLocalization/*.{h,m}'
end