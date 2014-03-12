//
//  UIButton+RKLocalization.m
//  MiawKit
//
//  Created by Ulrik Damm on 21/01/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import "UIButton+MKLocalization.h"
#import "MKLocalization.h"

@implementation UIButton (MKLocalization)

- (void)mk_localize {
	[self mk_localize:[self titleForState:UIControlStateNormal]];
}

- (void)mk_localize:(NSString *)localization {
	[self setTitle:MKLocalized(localization) forState:UIControlStateNormal];
}

@end
