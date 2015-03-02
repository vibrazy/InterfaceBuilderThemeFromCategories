//
//  InterfaceBuilderThemeFromCategoriesTests.m
//  InterfaceBuilderThemeFromCategoriesTests
//
//  Created by Daniel Tavares on 03/02/2015.
//  Copyright (c) 2014 Daniel Tavares. All rights reserved.
//
@import UIKit;
#import <XCTest/XCTest.h>
#import "UIColor+ProjectColors.h"

@interface ThemeAdditionsTests : XCTestCase

@end

@implementation ThemeAdditionsTests

- (BOOL)color:(UIColor *)color1
isEqualToColor:(UIColor *)color2
withTolerance:(CGFloat)tolerance {
    
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    return
    fabs(r1 - r2) <= tolerance &&
    fabs(g1 - g2) <= tolerance &&
    fabs(b1 - b2) <= tolerance &&
    fabs(a1 - a2) <= tolerance;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBackgroundUILabel
{
    UIColor *desiredColor = [UIColor oliveDrabColor];
    UILabel *label = [UILabel new];
    [label setValue:@"oliveDrabColor" forKey:@"_backgroundColor"];
    
    
    BOOL sameColor = [self color:desiredColor isEqualToColor:label.backgroundColor withTolerance:0];
    XCTAssert(sameColor, @"Colors are not the same");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end