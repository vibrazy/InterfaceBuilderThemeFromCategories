//
//  DHTInterfaceBuilderAppTheme.m
//
//  Created by Daniel Tavares on 26/02/2015.
//  Email vibrazy@hotmail.com
//  Copyright (c) 2015 Daniel Tavares. All rights reserved.

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

IB_DESIGNABLE

@import UIKit;

@interface NSObject(DHTThemeAdditions)

@property (nonatomic, copy) NSString *_textFont;
@property (nonatomic, copy) NSString *_textColor;
@property (nonatomic, copy) NSString *_backgroundColor;
@property (nonatomic, copy) NSString *_localizedText;
@property (nonatomic, copy) NSString *_titleColorNormalState;
@property (nonatomic, copy) NSString *_titleColorHighlightedState;

@end

@implementation NSObject (DHTThemeAdditions)

// dynamic user variables set in interface builder
@dynamic _textFont;
@dynamic _textColor;
@dynamic _backgroundColor;
@dynamic _localizedText;
@dynamic _titleColorNormalState;
@dynamic _titleColorHighlightedState;

#pragma mark - User Defined Attributes

#pragma mark - UIButton Specific

- (void)set_titleColorNormalState:(NSString *)methodName
{
    [self setTitleColorForMethodName:methodName forState:UIControlStateNormal];
}

- (void)set_titleColorHighlightedState:(NSString *)methodName
{
    [self setTitleColorForMethodName:methodName forState:UIControlStateHighlighted];
}

- (void)setTitleColorForMethodName:(NSString *)methodName
                          forState:(UIControlState)state
{
    if ([self isKindOfClass:[UIButton class]])
    {
        UIButton *button = (UIButton*)self;
        
        Class class = NSClassFromString(@"UIColor");
        SEL selector = NSSelectorFromString(methodName);
        
        UIColor *color;
        SuppressPerformSelectorLeakWarning(color = (UIColor*)[class performSelector:selector];);
        
        [button setTitleColor:color forState:state];
    }
    else // lets treat it as a normal textColor
    {
        [self set_textColor:methodName];
    }
}

#pragma mark -

- (void)set_textFont:(NSString *)methodName
{
    [self changeFontForCategoryMethodName:methodName classMethodName:@"setFont:"];
}

- (void)set_textColor:(NSString *)methodName
{
    [self changeTextColorForCategoryMethodName:methodName classMethodName:@"setTextColor:"];
}

- (void)set_backgroundColor:(NSString *)methodName
{
    [self changeTextColorForCategoryMethodName:methodName classMethodName:@"setBackgroundColor:"];
}
- (void)set_localizedText:(NSString *)_localizedText
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    NSString *string = [bundle localizedStringForKey:_localizedText value:@"" table:nil];
    SEL selector = NSSelectorFromString(@"setText:");
    
    //    string = [[bundle localizations] componentsJoinedByString:@","];
    
    if ([self respondsToSelector:selector])
    {
        SuppressPerformSelectorLeakWarning([self performSelector:selector withObject:string];);
    }
}

#pragma mark - Private Methods

- (void)changeFontForCategoryMethodName:(NSString *)methodName classMethodName:(NSString *)classMethodName
{
    [self performMethodName:methodName inClassName:@"UIFont" forSetterMethodName:classMethodName];
}

- (void)changeTextColorForCategoryMethodName:(NSString *)methodName classMethodName:(NSString *)classMethodName
{
    [self performMethodName:methodName inClassName:@"UIColor" forSetterMethodName:classMethodName];
}

#pragma mark - Base Method

- (void)performMethodName:(NSString *)methodName
              inClassName:(NSString *)className
      forSetterMethodName:(NSString *)setterName
{
    Class class = NSClassFromString(className);
    SEL selector = NSSelectorFromString(methodName);
    
    id object;
    SuppressPerformSelectorLeakWarning(object = [class performSelector:selector];);
    SEL setFontSelector = NSSelectorFromString(setterName);
    if ([self respondsToSelector:setFontSelector])
    {
        SuppressPerformSelectorLeakWarning([self performSelector:setFontSelector withObject:object];);
    }
}

@end

#pragma mark - Subclasses
// Include your own here if you want it to work in Interface Builder
IB_DESIGNABLE @interface DHTUIView : UIView  @end @implementation DHTUIView @end
IB_DESIGNABLE @interface DHTUILabel : UILabel  @end @implementation DHTUILabel @end
IB_DESIGNABLE @interface DHTUITextView : UITextView  @end @implementation DHTUITextView @end
IB_DESIGNABLE @interface DHTUIButton : UIButton  @end @implementation DHTUIButton @end
