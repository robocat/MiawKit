//
//  MKLocalization.h
//  MiawKit
//
//  Created by Ulrik Damm on 26/9/13.
//  Copyright (c) 2013 Robocat. All rights reserved.
//

#import <Foundation/Foundation.h>

void MKLocalizationSetPreferredLanguage(NSString *language);
NSString *MKLocalizationPreferredLanguage(void);

NSString *MKLocalizationNameForLanguage(NSString *language);
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

@protocol MKLocalizable <NSObject>

- (void)shouldLocalize;

@end

@interface MKLocalization : NSObject

+ (void)registerForLocalization:(id<MKLocalizable>)localizableObject;

+ (void)changeLocalizationTo:(NSString *)language;

@end
