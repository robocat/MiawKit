//
//  NSString+MLLocalization.h
//  MiawKit
//
//  Created by Kristian Andersen on 12/03/14.
//  Copyright (c) 2014 Robocat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MKLocalization)

/*!
 * Returns a localized string, using self as the key.
 * @return A localized string.
 * @see MKLocalizedString
 */
- (NSString *)mk_localizedString;

@end
