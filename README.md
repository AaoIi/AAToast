# AAToast

## Description
AAToast is a view containing a quick little message which could be short or long message, shows at the bottom of screen with duration.

## Preview Demo
<img src="https://lh5.googleusercontent.com/QQETZV-IhhqDfIKf4zD-WcXv4IlzGvlhrtE7Eh9wJMSpQoB92I1RtA=w373-h642-p-b1-c0x00999999">

### CocoaPods
[CocoaPods][] is a dependency manager for Cocoa projects. To install AAToast with CocoaPods:

1. Make sure CocoaPods is [installed][CocoaPods Installation].

2. Update your Podfile to include the following:

``` ruby
use_frameworks!
pod 'AAToast'
```

3. Run `pod install`.

[CocoaPods]: https://cocoapods.org
[CocoaPods Installation]: https://guides.cocoapods.org/using/getting-started.html#getting-started

4. In your code import AAToast like so:
`import AAToast`

## How to use AAToast ##
##### 1) Import AAToast<br/>

##### 2.1) Show Default Toast:<br/>

```swift

AAToast(toView: self.view, title: "No Internet Connection !!", duration: 2).show()

```

##### 2.2) Show Customizable Toast:<br/> 

```swift

AAToast(toView: self.view, title: "No Internet Connection !! Please try again later", duration: 2,textColor: .white,backgroundColor: .black,font: UIFont.systemFont(ofSize: 18)).show()


```

## Customization ##
This is all the properties in AAToast the you will be able to customize from your base view controller.

#### 1) Text Color<br/>

```swift

public func setTextColor(_ color:UIColor?)

```

#### 2) Toast Background Color<br/>

```swift

public func setBackgroundColor(_ color:UIColor?)

```

#### 3) Toast Font<br/>

```swift

public func setFont(_ font:UIFont?)

```

#### 4) Toast Bottom Padding<br/>

```swift

public func setBottomPadding(_ value:CGFloat?)

```

## Requierments ##

* Swift 5+
* IOS 8+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
