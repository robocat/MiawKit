//
//  UILabel+RKLocalization.h
//  MiawKit
//
//  Created by Ulrik Damm on 21/01/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MKLocalization)

- (void)mk_localize;

- (void)mk_localize:(NSString *)localization;

- (void)mk_localizeWithFormat:(NSString *)localization, ...;

- (void)mk_localize:(NSString *)localization
          fromTable:(NSString *)table;

- (void)mk_localizeFromTable:(NSString *)table
                  withFormat:(NSString *)localization, ...;


@end
