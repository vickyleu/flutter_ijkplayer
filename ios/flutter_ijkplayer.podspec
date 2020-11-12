#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_ijkplayer'
  s.version          = '0.0.1'
  s.summary          = 'IjkPlayer plugin for flutter'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Caijinglong' => 'cjl_spy@163.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*' ##//, 'IJKMediaFramework.framework'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.static_framework = false


  s.libraries = "bz2", "z", "stdc++"
  s.frameworks  = "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "CoreServices", "Metal", "QuartzCore", "VideoToolbox", "Foundation", "UIKit", "MediaPlayer"

  s.dependency 'FlutterIJK', '= 0.2.3'
  s.ios.vendored_frameworks = 'IJKMediaFramework.framework'

  //## valid_archs = ['arm64','arm64e','armv7s'] //,'x86_64'
  //s.xcconfig = {
  //  'VALID_ARCHS' =>  valid_archs.join(' '),
  //}
  //s.pod_target_xcconfig = {
   //   'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)'
  //}

  s.ios.deployment_target = '8.0'

end

