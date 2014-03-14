# MiawKit

MiawKit is a collection of utilities that makes life a little easier when localizing apps for iOS and OS X. The kit is made up of three different parts that works nice together. The first part is a set of functions that replace ``NSLocalizedString``. The second part is a set of UIKit and AppKit categories on stuff like labels and buttons that make it easier to localize single view parts. The last part is a script that will turn your localized keys from your strings files into constants in your code.

## Getting started

As modern 21st century brogrammer you're of cause using [CocoaPods](http://cocoapods.org)! Right, right?

    pod 'MiawKit', :git => 'https://github.com/robocat/MiawKit.git'
  
If you're planning on using the scrit portion of MiawKit you will have to copy the [miaw script](miaw) into the root directory of your project manually.
