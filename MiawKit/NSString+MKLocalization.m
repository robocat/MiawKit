//
//  NSString+MLLocalization.m
//  MiawKit
//
//  Created by Kristian Andersen on 12/03/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import "NSString+MKLocalization.h"
#import "MKLocalization.h"

@implementation NSString (MKLocalization)

- (NSString *)mk_localizedString {
	return MKLocalized(self);
}

@end
