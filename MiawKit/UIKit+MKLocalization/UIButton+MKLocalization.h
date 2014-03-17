//
//  UIButton+RKLocalization.h
//  MiawKit
//
//  Created by Ulrik Damm on 21/01/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MKLocalization)

/*!
 * Localize the button using the current text of the button
 * as the key value for the localized string lookup.
 */
- (void)mk_localize;

/*!
 * Localize the button using the given localization key
 * @param localization The localization key
 */
- (void)mk_localize:(NSString *)localization;

/*!
 * Localize the button using the given localization key
 * and format it with the given extra parameters.
 * @param localization The localization key
 * @param ... The extra parameters used to format the localized string
 */
- (void)mk_localizeWithFormat:(NSString *)localization, ...;

/*!
 * Localize the button using the given localization key
 * from the given table.
 * @param localization The localization key
 * @param table The table used for the localized string lookup
 */
- (void)mk_localize:(NSString *)localization
          fromTable:(NSString *)table;

/*!
 * Localize the button using the given localization key
 * from the given table and format it using the given
 * extra parameters.
 * @param localization The localization key
 * @param table The table used for the localized string lookup
 * @param ... The extra parameters used to format the localized string
 */
- (void)mk_localizeFromTable:(NSString *)table
                  withFormat:(NSString *)localization, ...;

@end
