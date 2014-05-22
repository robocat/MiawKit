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

    ./miaw --g
    
Which generates the ``MKLocalizaableKeys.h`` file in your root directory. Include that file in your Xcode project and you're all good to go.

Run `miaw -h` for more information on how to use the ``miaw`` file.

## MKLocalization

MiawKit provides a simple API to register for localization changes. Classes in your codebase that needs to be updated with localization once they're displayed or when the language is changed can register for changes using ``MKLocalization``'s  ``registerForLocalization:`` method:

```objc
/*!
 * Register an object implementing the MKLocalizable protocol
 * for localization. Calling this method will invoke the
 * -shouldLocalize method of the passed object immediately. It
 * will also invoke the method if the preferred language changes.
 * @param localizableObject The object to register for localization
 */
+ (void)registerForLocalization:(id<MKLocalizable>)localizableObject;
```

Your class then needs to conform to the ``MKlocalizable`` protocol which calls ``shouldLocalize`` when localization changes are needed. Here is an example of how you might use the API in a ``UIViewController``.

```objc
- (void)viewDidLoad {
    [self viewDidLoad];
    
    [MKLocalization registerForLocalization:self];
}

- (void)shouldLocalize {
    [self.awesomeLabel mk_localize];
    [self.awesomeOtherLabel mk_localizeWithFormat:MK_AWESOME_OTHER_LABEL, self.awesomeValue];
}
```

If you want to change the language used within your app you can use ``changeLocalizationTo:`` to change the language. All registered objects will be relocalized.

```objc
/*!
 * Change the preferred language to a given language. Changing the
 * preferred language will invoke the -shouldLocalize method of all
 * registered localizable objects.
 * @param language The language identifier for the new language
 */
+ (void)changeLocalizationTo:(NSString *)language;
```

## UIKit Categories

MiawKit provides useful category methods for [UIButton](MiawKit/UIKit+MKLocalization/UIButton+MKLocalization.h) and [UILabel](MiawKit/UIKit+MKLocalization/UIlabel+MKLocalization.h) to ease localization of UI elements. Both categories share methods for localizing using the title as key:

```objc
[self.awesomeLabel mk_localize];
```

or given the key:

```objc
[self.awesomeLabel mk_localize:MK_AWESOME_BUTTON];
```

or with a formatted string:

```objc
[self.awesomeLabel mk_localizeWithFormat:MK_AWESOME_BUTTON, self.awesomeValue];
```
