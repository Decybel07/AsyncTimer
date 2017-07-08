
Pod::Spec.new do |s|
  s.name             = 'AsyncTimer'
  s.version          = '1.0.0'
  s.summary          = 'AsyncTimer is an asynchronous timer that can work in the background.'

  s.homepage         = 'https://github.com/Decybel07/AsyncTimer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adrian Bobrowski' => 'adrian071993@gmail.com' }
  s.source           = { :git => "https://github.com/Decybel07/AsyncTimer.git", :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Source/**/*.swift'
  s.frameworks = 'Foundation'
end
