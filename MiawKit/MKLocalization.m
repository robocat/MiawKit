//
//  MKLocalization.m
//  MiawKit
//
//  Created by Ulrik Damm on 26/9/13.
//  Copyright (c) 2013 Robocat. All rights reserved.
//

#import "MKLocalization.h"

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
