# AAToast

## Description
AAToast is a view containing a quick little message which could be short or long message, shows at the bottom of screen with duration.

## Preview Demo
<img src="https://lh5.googleusercontent.com/QQETZV-IhhqDfIKf4zD-WcXv4IlzGvlhrtE7Eh9wJMSpQoB92I1RtA=w373-h642-p-b1-c0x00999999">

## How to use AAToast ##
##### 1) import ```AAToast.swift``` and ```AAToastView``` into your project <br/>
##### 2) Create object from AAToast: ```var toast : AAToast!``` <br/>
##### 3) Show AAToast:<br/><br/>     

##### 3.1) Short Message:<br/>

```swift

// send the current view frame and set the text with duration, and toast type is short.
toast = AAToast(frame: self.view.frame, title: "No Internet Connection !!", duration: 3,type: .short)
self.view.addSubview(toast)

```

##### 3.2) Long Message:<br/> 

```swift

// send the current view frame and set the text with duration, and toast type is long.
toast = AAToast(frame: self.view.frame, title: "No Internet Connection !! Please try again later", duration: 3,type: .long)
self.view.addSubview(toast)

```

##Customization ##
This is all the properties in AAToast the you will be able to customize from your base view controller.

#### 1) Text Color<br/>

```swift

setTextColor(UIColor)

```

#### 2) Toast Color<br/>

```swift

setToastColor(UIColor)

```

## Requierments ##

* Swift 2.0+
* IOS 7.0+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
