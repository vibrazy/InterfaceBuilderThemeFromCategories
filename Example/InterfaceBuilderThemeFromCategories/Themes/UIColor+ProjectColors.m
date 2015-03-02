//
//  UIColor+ProjectColors.m
//  InterfaceBuilderDynamicColorsAndFonts
//
//  Created by Daniel Tavares on 26/02/2015.
//  Copyright (c) 2015 Daniel Tavares. All rights reserved.
//

#import "UIColor+ProjectColors.h"

@implementation UIColor (ProjectColors)

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (instancetype)babyBlueColor
{
    return [[self class] colorWithR:190 G:220 B:230 A:1.0];
}

+ (instancetype)oliveDrabColor
{
     return [[self class] colorWithR:107 G:142 B:35 A:1.0];
}

+ (instancetype)moneyGreenColor
{
    return [[self class] colorWithR:134 G:198 B:124 A:1.0];
}

+ (instancetype)honeydewColor
{
    return [[self class] colorWithR:216 G:255 B:231 A:1.0];
}
+ (instancetype)limeColor
{
    return [[self class] colorWithR:56 G:237 B:56 A:1.0];
}

+ (instancetype)blackCustom
{
    return [[self class] colorWithWhite:0.0 alpha:0.8];
}

@end
