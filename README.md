# ClearTextSwitch

[![Version](https://img.shields.io/cocoapods/v/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)
[![License](https://img.shields.io/cocoapods/l/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)
[![Platform](https://img.shields.io/cocoapods/p/ClearTextSwitch.svg?style=flat)](http://cocoapods.org/pods/ClearTextSwitch)

![](/Video/demo.gif) 

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
    @IBOutlet weak var firstClearTextSwitch: ClearTextSwitch!
    private lazy var secondClearTextSwitch = {
        var obj = ClearTextSwitch(frame: CGRectMake(50,50,200,50))
        obj.delegate = self
        obj.normalBackgroundColor = UIColor.greenColor()
        obj.selectedBackgroundColor = UIColor.grayColor()
        obj.title = "2."
        return obj
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstClearTextSwitch.delegate = self
        self.view.addSubview(self.secondClearTextSwitch)
    }
    
    func clearTextSwitchDidChange(clearTextSwitch: ClearTextSwitch) {
        print("clearTextSwitchDidChange to \(clearTextSwitch.selected)")
    }
}
```

## License

ClearTextSwitch is available under the MIT license. See the LICENSE file for more info.
