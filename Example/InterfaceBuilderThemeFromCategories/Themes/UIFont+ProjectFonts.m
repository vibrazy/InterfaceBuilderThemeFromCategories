//
//  UIFont+ProjectFonts.m
//  InterfaceBuilderDynamicColorsAndFonts
//
//  Created by Daniel Tavares on 26/02/2015.
//  Copyright (c) 2015 Daniel Tavares. All rights reserved.
//

#import "UIFont+ProjectFonts.h"

@implementation UIFont (ProjectFonts)

+ (instancetype)header1
{
    return [UIFont fontWithName:@"Helvetica-Light" size:24.f];
}

+ (instancetype)body1
{
     return [UIFont fontWithName:@"Helvetica-Light" size:34.f];
}

+ (instancetype)body2
{
        return [UIFont fontWithName:@"Helvetica-Light" size:14.f];
}

@end
