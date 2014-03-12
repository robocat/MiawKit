//
//  MKLocalization.m
//  MiawKit
//
//  Created by Ulrik Damm on 26/9/13.
//  Copyright (c) 2013 Robocat. All rights reserved.
//

#define MK_NOT_AVAILABLE @"MK_LOCALIZED_STRING_NOT_AVAILABLE"

#import "MKLocalization.h"

void MKLocalizationSetPreferredLanguage(NSString *language) {
	[[NSUserDefaults standardUserDefaults] setObject:@[ language ] forKey:@"AppleLanguages"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

NSString *MKLocalizationNameForPrefferedLanguage(void) {
    return MKLocalizationNameForLanguage(MKLocalizationPreferredLanguage());
}

NSString *MKLocalizationNameForLanguage(NSString *language) {
    NSString *languageName = [[NSLocale localeWithLocaleIdentifier:language] displayNameForKey:NSLocaleIdentifier value:language];
    languageName = [languageName stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[languageName uppercaseString] substringToIndex:1]];
    return languageName;
}

NSString *MKLocalizationPreferredLanguage(void) {
	return [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] firstObject];
}

NSString *MKLocalized(NSString *str) {
	return MKLocalizedFromTable(str, nil);
}

NSString *MKLocalizedFromTable(NSString *str, NSString *table) {
	NSString *languageCode = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] firstObject];
	NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:languageCode ofType:@"lproj"]];
	
	NSString *string = [bundle localizedStringForKey:str value:MK_NOT_AVAILABLE table:table];
	
	if (!string || [string isEqualToString:MK_NOT_AVAILABLE]) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
		return [[NSBundle bundleWithPath:path] localizedStringForKey:str value:@"---" table:table]?: @"---";
	}
	
    return string;
}

NSString *MKLocalizedWithFormat(NSString *str, ...) {
	va_list vars;
	va_start(vars, str);
	
	NSString *string = [[NSString alloc] initWithFormat:MKLocalized(str) arguments:vars];
	
	va_end(vars);
	return string;
}

NSString *MKLocalizedFromTableWithFormat(NSString *str, NSString *table, ...) {
	va_list vars;
	va_start(vars, table);
	
	NSString *string = [[NSString alloc] initWithFormat:MKLocalizedFromTable(str, table) arguments:vars];
	
	va_end(vars);
	return string;
}

void MKLocalizedLabel(UILabel *label, NSString *str) {;
    MKLocalizedLabelFromTable(label, str, nil);
}

void MKLocalizedLabelFromTable(UILabel *label, NSString *str, NSString *table) {
    NSString *string = MKLocalizedFromTable(str, table);
    
    [label setText:string];
}

void MKLocalizedLabelWithFormat(UILabel *label, NSString *str, ...) {
    va_list vars;
    va_start(vars, str);
    
    NSString *string = [[NSString alloc] initWithFormat:MKLocalized(str) arguments:vars];
    [label setText:string];
    
    va_end(vars);
}

void MKLocalizedLabelFromTableWithFormat(UILabel *label, NSString *str, NSString *table, ...) {
    va_list vars;
    va_start(vars, table);
    
    NSString *string = [[NSString alloc] initWithFormat:MKLocalizedFromTable(str, table) arguments:vars];
    [label setText:string];
    
    va_end(vars);
}

void MKLocalizedButton(UIButton *button, NSString *str) {
    MKLocalizedButtonFromTable(button, str, nil);
}

void MKLocalizedButtonFromTable(UIButton *button, NSString *str, NSString *table) {
    NSString *string = MKLocalizedFromTable(str, table);
    
    [button setTitle:string forState:UIControlStateNormal];
}

void MKLocalizedButtonWithFormat(UIButton *button, NSString *str, ...) {
    va_list vars;
    va_start(vars, str);
    
    NSString *string = [[NSString alloc] initWithFormat:MKLocalized(str) arguments:vars];
    [button setTitle:string forState:UIControlStateNormal];
    
    va_end(vars);
}

void MKLocalizedButtonFromTableWithFormat(UIButton *button, NSString *str, NSString *table, ...) {
    va_list vars;
    va_start(vars, table);
    
    NSString *string = [[NSString alloc] initWithFormat:MKLocalizedFromTableWithFormat(str, table) arguments:vars];
    [button setTitle:string forState:UIControlStateNormal];
    
    va_end(vars);
}

@interface MKLocalization ()

@property (strong, nonatomic) NSPointerArray *localizables;

@end

@implementation MKLocalization

- (id)init {
	if ((self = [super init])) {
		self.localizables = [NSPointerArray weakObjectsPointerArray];
	}
	
	return self;
}

+ (MKLocalization *)sharedInstance {
	static MKLocalization *instance = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[MKLocalization alloc] init];
	});
	
	return instance;
}

+ (void)registerForLocalization:(id<MKLocalizable>)localizableObject {
	[[[self sharedInstance] localizables] addPointer:(__bridge void *)(localizableObject)];
	
	[localizableObject shouldLocalize];
}

+ (void)changeLocalizationTo:(NSString *)language {
	MKLocalizationSetPreferredLanguage(language);
	
	for (id<MKLocalizable> localizableObject in [[self sharedInstance] localizables]) {
		[localizableObject shouldLocalize];
	}
}

@end
