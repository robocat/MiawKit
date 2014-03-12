//
//  MKLocalization.h
//  MiawKit
//
//  Created by Ulrik Damm on 26/9/13.
//  Copyright (c) 2013 Robocat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKFunctions.h"

@protocol MKLocalizable;

/*!
 * Utility localization class that provides objects with a way
 * to register for localizations and language updates.
 */
@interface MKLocalization : NSObject

/*!
 * Register an object implementing the MKLocalizable protocol
 * for localization. Calling this method will invoke the
 * -shouldLocalize method of the passed object immediately. It
 * will also invoke the method if the preferred language changes.
 * @param localizableObject The object to register for localization
 */
+ (void)registerForLocalization:(id<MKLocalizable>)localizableObject;

/*!
 * Change the preferred language to a given language. Changing the
 * preferred language will invoke the -shouldLocalize method of all
 * registered localizable objects.
 * @param language The language identifier for the new language
 */
+ (void)changeLocalizationTo:(NSString *)language;

@end

/*!
 * Protocol for localizable objects. Objects that implement this
 * protocol should also be registered with
 * [MKLocalization registerForLocalization:].
 */
@protocol MKLocalizable <NSObject>

- (void)shouldLocalize;

@end
