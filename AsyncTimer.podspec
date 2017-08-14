
Pod::Spec.new do |spec|
  spec.name             = 'AsyncTimer'
  spec.version          = '2.1.0'
  spec.summary          = 'AsyncTimer is a precision asynchronous timer. You can also use it as a countdown timer'

  spec.description      = <<-DESC
    AsyncTimer is a pod that adds precision asynchronous timer to your app
      * Working with user events (like: scrolling, tapping, ...).
      * Functionality (start, pause, resume, stop, restart)
      * Support for clousure (never more selectors)
      * Can work as a countdown timer
      * Can work in background.
                       DESC

  spec.homepage         = 'https://github.com/Decybel07/AsyncTimer'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Adrian Bobrowski' => 'adrian071993@gmail.com' }
  spec.source           = { :git => "https://github.com/Decybel07/AsyncTimer.git", :tag => spec.version }

  spec.ios.deployment_target = '9.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'

  spec.source_files = 'Source/**/*.swift'
  spec.frameworks = 'Foundation'
end
