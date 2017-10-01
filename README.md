# AsyncTimer

[![Build Status](https://travis-ci.org/Decybel07/AsyncTimer.svg?branch=master&style=flat)](https://travis-ci.org/Decybel07/AsyncTimer)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/AsyncTimer.svg?style=flat&label=version)](http://cocoapods.org/pods/AsyncTimer)
[![Language Swift3](https://img.shields.io/badge/languages-Swift%203.0+-FFAC45.svg?style=flat)](https://developer.apple.com/swift/) 
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/AsyncTimer.svg?style=flat&label=platform)](http://cocoapods.org/pods/AsyncTimer)
[![CocoaPods License](https://img.shields.io/cocoapods/l/AsyncTimer.svg?style=flat&label=license)](https://github.com/Decybel07/AsyncTimer/blob/master/LICENSE)
[![Docs percent](https://img.shields.io/badge/docs-100%25-brightgreen.svg)](http://cocoadocs.org/docsets/AsyncTimer/)
[![Pod method Compatible](https://img.shields.io/badge/supports-CocoaPods%20%7C%20Carthage%20%7C%20Swift%20Package%20Manager-green.svg?style=flat)](#-installation)
[![codebeat badge](https://codebeat.co/badges/648d2a8b-2cb5-4956-b19c-454dc35912fd)](https://codebeat.co/projects/github-com-decybel07-asynctimer-master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/63d5b063f7ba44dfb4d96447886aff3a)](https://www.codacy.com/app/Decybel07/AsyncTimer/dashboard)

## 🌟 Features

- [x] Can work as a countdown timer
- [x] Can work as a periodic Timer
- [x] Can work as a scheduled timer
- [x] Working with user events (like: scrolling, tapping, ...)
- [x] Functionality (start, pause, resume, stop, restart)
- [x] Support for clousure (never more selectors)

##  Overview

<p align="center">
<table><tr>
 <td><img src="https://raw.githubusercontent.com/Decybel07/AsyncTimer/master/Images/countdown720.gif" alt="Countdown timer"/></td>
 <td><img src="https://raw.githubusercontent.com/Decybel07/AsyncTimer/master/Images/Periodic720.gif" alt="Periodic timer"/></td>
 <td><img src="https://raw.githubusercontent.com/Decybel07/AsyncTimer/master/Images/scheduled720.gif" alt="scheduled timer"/></td>
</tr></table>
</p>

## 💻 Demo

```ruby
pod try AsyncTimer
```

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
pod 'AsyncTimer', '~> 2.2'
```

### [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "Decybel07/AsyncTimer", ~> 2.2
```

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
.Package(url: "https://github.com/Decybel07/AsyncTimer.git", majorVersion: 2)
```

## 📘 [Usage](http://cocoadocs.org/docsets/AsyncTimer/)

Import AsyncTimer at the top of each Swift file that will use framework.
```swift
import AsyncTimer
```

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

Do something after 2 seconds

```swift
AsyncTimer(interval: .seconds(2)) {
    print("something to do")
}
`````

## 🤓 Author

Adrian Bobrowski ([Decybel07](https://github.com/Decybel07)), adrian071993@gmail.com

## 🔑 License

AsyncTimer is available under the MIT license. See the [LICENSE](https://github.com/Decybel07/AsyncTimer/blob/master/LICENSE) file for more info.
