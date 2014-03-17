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
    [self mk_localize:localization fromTable:nil];
}

- (void)mk_localizeWithFormat:(NSString *)localization, ... {
    va_list vars;
    va_start(vars, localization);

    [self mk_localizeFromTable:nil withFormat:localization, vars];

    va_end(vars);
}

- (void)mk_localize:(NSString *)localization fromTable:(NSString *)table {
    [self setTitle:MKLocalizedFromTable(localization, table) forState:UIControlStateNormal];
}

- (void)mk_localizeFromTable:(NSString *)table withFormat:(NSString *)localization, ... {
    va_list vars;
    va_start(vars, localization);

    [self setTitle:MKLocalizedFromTableWithFormat(localization, table, vars) forState:UIControlStateNormal];

    va_end(vars);
}


@end
