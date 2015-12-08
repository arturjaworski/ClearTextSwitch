# ClearTextSwitch

[![CI Status](http://img.shields.io/travis/arturjaworski/ClearTextSwitch.svg?style=flat)](https://travis-ci.org/arturjaworski/ClearTextSwitch)
[![Version](https://img.shields.io/cocoapods/v/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)
[![License](https://img.shields.io/cocoapods/l/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)
[![Platform](https://img.shields.io/cocoapods/p/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)

## Installation

ClearTextSwitch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ClearTextSwitch"
```

## Quick Start

```swift
import ClearTextSwitch
class ViewController: UIViewController, ClearTextSwitchDelegate {
    @IBOutlet weak var clearTextSwitch: ClearTextSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearTextSwitch.delegate = self
    }
    
    func clearTextSwitchDidChange(clearTextSwitch: ClearTextSwitch) {
        print("clearTextSwitchDidChange to \(clearTextSwitch.selected)")
    }
}
```

## License

ClearTextSwitch is available under the MIT license. See the LICENSE file for more info.
