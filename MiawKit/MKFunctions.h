//
//  MKFunctions.h
//  MiawKit
//
//  Created by Kristian Andersen on 12/03/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * Get the currently preferred language
 * @return The identifier for the current language
 */
NSString *MKLocalizationPreferredLanguage(void);

/*!
 * Change the preferred language. This should not be called directly
 * if the MKLocalizable protocol is used. This function is called internally
 * by MKLocalization. Please use [MKLocalization changeLocalizationTo:] instead.
 * @param language The new language
 */
void MKLocalizationSetPreferredLanguage(NSString *language);

/*!
 * Get the fully qualified name for a given language identifier.
 * e.g. given the identifier "da" the answer will be "Dansk"
 * @param language The identifier for the language
 * @return Fully qualified name for the language
 */
NSString *MKLocalizationNameForLanguage(NSString *language);

/*!
 * Get the fully qualified name for the preferred language.
 * @see MKLocalizationSetPreferredLanguage
 * @return The fully qualified name for the preferred language
 */
NSString *MKLocalizationNameForPrefferedLanguage(void);

/*!
 * Get the fully qualified name for a given language identifier
 * in the language of the given other language.
 * e.g. given the identifier "da" and "en" the answer will be
 * "Danish"
 * @param language The identifier for the language
 * @return Fully qualified name for the language
 */
NSString *MKLocalizationNameForLanguageInLanguage(NSString *language, NSString *inLanguage);

/*!
 * Get a localized version of the string for the given key.
 * @param str The key for the localized string
 * @return The formatted localized string. If no string is found for the preferred language
 * a version in english is returned. If none exists it will return nil.
 * @discussion The preferred use of this is to only pass in strings defined in the header generated with the miaw tool.
 */
NSString *MKLocalized(NSString *str);

/*!
 * Get a localized version of the string for the
 * given key residing in the specified table.
 * @param str The key for the localized string
 * @param table The table to search. If nil, the Localizable.strings table is searched
 * @return The formatted localized string. If no string is found for the preferred language
 * a version in english is returned. If none exists it will return nil.
 * @discussion The preferred use of this is to only pass in strings defined in the header generated with the miaw tool.
 */
NSString *MKLocalizedFromTable(NSString *str, NSString *table);

/*!
 * Get a formatted localized version of the string for the
 * given key.
 * @param str The key for the localized string
 * @return The formatted localized string. If no string is found for the preferred language
 * a version in english is returned. If none exists it will return nil.
 * @discussion The preferred use of this is to only pass in strings defined in the header generated with the miaw tool.
 */
NSString *MKLocalizedWithFormat(NSString *str, ...);

/*!
 * Get a formatted localized version of the string for the
 * given key residing in the specified table.
 * @param str The key for the localized string
 * @param table The table to search. If nil, the Localizable.strings table is searched
 * @return The formatted localized string. If no string is found for the preferred language
 * a version in english is returned. If none exists it will return nil.
 * @discussion The preferred use of this is to only pass in strings defined in the header generated with the miaw tool.
 */
NSString *MKLocalizedFromTableWithFormat(NSString *str, NSString *table, ...);
