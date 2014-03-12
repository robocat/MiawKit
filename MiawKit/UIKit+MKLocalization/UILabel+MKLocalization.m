//
//  UILabel+RKLocalization.m
//  MiawKit
//
//  Created by Ulrik Damm on 21/01/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import "UILabel+MKLocalization.h"
#import "MKLocalization.h"

@implementation UILabel (MKLocalization)

- (void)mk_localize {
	[self mk_localize:self.text];
}

- (void)mk_localize:(NSString *)localization {
	self.text = MKLocalized(localization);
}

@end
