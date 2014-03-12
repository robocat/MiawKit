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


NSString *MKLocalized(NSString *str);
NSString *MKLocalizedFromTable(NSString *str, NSString *table);

NSString *MKLocalizedWithFormat(NSString *str, ...);
NSString *MKLocalizedFromTableWithFormat(NSString *str, NSString *table, ...);

void MKLocalizedLabel(UILabel *label, NSString *str);
void MKLocalizedLabelFromTable(UILabel *label, NSString *str, NSString *table);
void MKLocalizedLabelWithFormat(UILabel *label, NSString *str, ...);
void MKLocalizedLabelFromTableWithFormat(UILabel *label, NSString *str, NSString *table, ...);

void MKLocalizedButton(UIButton *button, NSString *str);
void MKLocalizedButtonFromTable(UIButton *button, NSString *str, NSString *table);
void MKLocalizedButtonWithFormat(UIButton *button, NSString *str, ...);
void MKLocalizedButtonFromTableWithFormat(UIButton *button, NSString *str, NSString *table, ...);
