# MiawKit

MiawKit is a collection of utilities that makes life a little easier when localizing apps for iOS and OS X. The kit is made up of three different parts that works nice together. The first part is a set of functions that replace ``NSLocalizedString``. The second part is a set of UIKit and AppKit categories on stuff like labels and buttons that make it easier to localize single view parts. The last part is a script that will turn your localized keys from your strings files into constants in your code.

## Getting started

As modern 21st century brogrammer you're of cause using [CocoaPods](http://cocoapods.org)! Right, right?

    pod 'MiawKit', :git => 'https://github.com/robocat/MiawKit.git'
  
If you're planning on using the scrit portion of MiawKit you will have to copy the [miaw script](miaw) into the root directory of your project manually.

## miaw

An essential part of MiawKit is the ``miaw`` command line utility itself. It is a small ruby script that generates constants for all your localization keys. This avoids "stringly-typed" keys in your code and helps Xcode autocomplete your localization keys. ``miaw`` works by searching through your project directory for all ``.strings`` files located in ``.lproj`` directories. It generates the file ``MKLocalizableKeys.h`` which contains a constant for each key found. Each constant is documented with all localizations found for that key. Here is an example of what that looks like:

```c
/*!
 * "Let's play Wordbase!"
 * All translations:
 * @b da@: "Lad os spille Wordbase!"
 * @b en@: "Let's play Wordbase!"
 * @b es@: "¡Vamos a jugar a Wordbase!"
 * @b fi@: "Pelataan Wordbase-peliä!"
 * @b nb@: "La oss spille Wordbase!"
 * @b sv@: "Spela Wordbase med mig!"
 */
static NSString * const RK_FACEBOOK_INVITE_TITLE = @"RK_FACEBOOK_INVITE_TITLE";
```

XCode is even smart enough to show you the documentation so you can see the translation for a key by alt-clicking any localization key constant.

![](http://f.cl.ly/items/3K0p2Z3D1t2h013p1p17/Screen%20Shot%202014-05-13%20at%2011.42.32.png)

Make sure that you copy the ``miaw`` file into the root directory of your project and run the command:

    miaw --generate
    
Which generates the ``MKLocalizaableKeys.h`` file in your root directory. Include that file in your Xcode project and you're all good to go.

Run `miaw -h` for more information on how to use the ``miaw`` file.