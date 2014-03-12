Pod::Spec.new do |s|
  s.name              = 'MiawKit'
  s.version           = '1.0'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.summary           = 'A set of utilities that gives localization in Objective-C a little more miaw'
  s.homepage          = 'https://github.com/robocat/MiawKit'
  s.authors           = { 'Robocat' => 'hello@robo.cat' }
  s.source            = { :git => 'https://github.com/robocat/MiawKit.git', :branch => 'master' }
  s.social_media_url  = 'http://twitter.com/robocat'

  s.platform          = :ios, '6.0'
  s.requires_arc      = true

  s.source_files      = 'MiawKit/**/*.{h,m}'
end