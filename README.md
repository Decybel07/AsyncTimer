# AsyncTimer

[![Build Status](https://travis-ci.org/Decybel07/AsyncTimer.svg?branch=master&style=flat)](https://travis-ci.org/Decybel07/AsyncTimer)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/AsyncTimer.svg?style=flat&label=version)](http://cocoapods.org/pods/AsyncTimer)
[![Language Swift3](https://img.shields.io/badge/languages-Swift%203.0+-FFAC45.svg?style=flat)](https://developer.apple.com/swift/) 
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/AsyncTimer.svg?style=flat&label=platform)](http://cocoapods.org/pods/AsyncTimer)
[![CocoaPods License](https://img.shields.io/cocoapods/l/AsyncTimer.svg?style=flat&label=license)](https://github.com/Decybel07/AsyncTimer/blob/master/LICENSE)
[![Pod method Compatible](https://img.shields.io/badge/supports-CocoaPods%20%7C%20Carthage%20%7C%20Swift%20Package%20Manager-green.svg?style=flat)](#-installation)
[![codebeat badge](https://codebeat.co/badges/648d2a8b-2cb5-4956-b19c-454dc35912fd)](https://codebeat.co/projects/github-com-decybel07-asynctimer-master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/63d5b063f7ba44dfb4d96447886aff3a)](https://www.codacy.com/app/Decybel07/AsyncTimer/dashboard)

## ⚠️ Requirements

- iOS 9.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+
- Swift 3.0+

## 👥 Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## 📗 Installation

### [CocoaPods](http://cocoapods.org)

```ruby
pod 'AsyncTimer', '~> 2.0'
```

### [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "Decybel07/AsyncTimer", ~> 2.0
```

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
.Package(url: "https://github.com/Decybel07/AsyncTimer.git", majorVersion: 2)
```

## 📘 [Usage](http://cocoadocs.org/docsets/AsyncTimer/)

### Countdown Timer

Counts down from 25 to 0 every 100 ms

```swift
AsyncTimer(
    interval: .milliseconds(100),
    times: 25,
    block: { value in
        print(value)
    }, 
    completion: { value in
        print("finished")
    }
)
```

### Periodic Timer

Update every 100 ms

```swift
AsyncTimer(interval: .milliseconds(100), repeats: true) { 
    print("updated")
}
```

### Scheduled Timer

After 2 seconds do something

```swift
return AsyncTimer(interval: .seconds(2)) { [weak self] in
    print("finished")
}
```

### Functionalities

#### Start the timer

```swift
timer.start()
```

#### Stop the timer

```swift
timer.stop()
```

#### Resrart the timer

```swift
timer.restart()
```

## 🤓 Author

Adrian Bobrowski ([Decybel07](https://github.com/Decybel07)), adrian071993@gmail.com

## 🔑 License

AsyncTimer is available under the MIT license. See the [LICENSE](https://github.com/Decybel07/AsyncTimer/blob/master/LICENSE) file for more info.
