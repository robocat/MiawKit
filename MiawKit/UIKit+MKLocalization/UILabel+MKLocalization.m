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
    [self mk_localize:localization fromTable:nil];;
}

- (void)mk_localizeWithFormat:(NSString *)localization, ... {
    va_list vars;
    va_start(vars, localization);

    [self mk_localizeFromTable:nil withFormat:localization, vars];

    va_end(vars);
}

- (void)mk_localize:(NSString *)localization fromTable:(NSString *)table {
    [self setText:MKLocalizedFromTable(localization, table)];
}

- (void)mk_localizeFromTable:(NSString *)table withFormat:(NSString *)localization, ... {
    va_list vars;
    va_start(vars, localization);

    [self setText:MKLocalizedFromTableWithFormat(localization, table, vars)];

    va_end(vars);
}


@end
