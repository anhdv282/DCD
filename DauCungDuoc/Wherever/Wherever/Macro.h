//
//  Macro.h
//  EAPB2BApp
//
//  Created by Joy Aether Limited.
//  Copyright (c) 2015 Joyaether.com. All rights reserved.
//

#ifndef EAPB2BApp_Macro_h
#define EAPB2BApp_Macro_h

#define _session [Session currentSession]
#define _log(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

#define APP_SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
#define APP_SCREEN_WIDTH [[UIScreen mainScreen] applicationFrame].size.width
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 alpha:1.0]

/** String: System Version **/
#define SYSTEM_VERSION ( [[[UIDevice currentDevice ] systemVersion ] integerValue] )
#define IS_IOS8  (SYSTEM_VERSION >= 8)

#define IS_IOS7  (SYSTEM_VERSION >= 7 && SYSTEM_VERSION < 8)

#define IS_IOS6  (SYSTEM_VERSION < 7)

#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define NEW_VC(className) [[className alloc] initWithNibName:[Util getXIB:[className class]] bundle:nil]
#define V(x,y) IS_IPAD()?x:y
#define DEVICE_VERSION                      [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma - mark DEVICE INFORMATION

/** String: Identifier **/
#define DEVICE_IDENTIFIER ( ( IS_IPAD ) ? DEVICE_IPAD : ( IS_IPHONE ) ? DEVICE_IPHONE , DEVICE_SIMULATOR )

/** String: iPhone **/
#define DEVICE_IPHONE @"iPhone"

/** String: iPad **/
#define DEVICE_IPAD @"iPad"

/** String: Device Model **/
#define DEVICE_MODEL ( [[UIDevice currentDevice ] model ] )

/** String: Localized Device Model **/
#define DEVICE_MODEL_LOCALIZED ( [[UIDevice currentDevice ] localizedModel ] )

/** String: Device Name **/
#define DEVICE_NAME ( [[UIDevice currentDevice ] name ] )

/** Double: Device Orientation **/
#define DEVICE_ORIENTATION ( [[UIDevice currentDevice ] orientation ] )

/* make sure a default max version is set */
#ifndef __IPHONE_OS_VERSION_MAX_ALLOWED
#define __IPHONE_OS_VERSION_MAX_ALLOWED     __IPHONE_6_1
#endif

/** String: Simulator **/
#define DEVICE_SIMULATOR @"Simulator"

/** String: Device Type **/
#define DEVICE_TYPE ( [[UIDevice currentDevice ] deviceType ] )

/** BOOL: Detect if device is an iPhone or iPod **/
#define IS_IPHONE ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )

/** BOOL: IS_RETINA **/
#define IS_RETINA ( [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2 )

/** BOOL: Detect if device is the Simulator **/
#define IS_SIMULATOR ( TARGET_IPHONE_SIMULATOR )

#pragma - mark SYSTEM INFORMATION

/** String: System Name **/
#define SYSTEM_NAME ( [[UIDevice currentDevice ] systemName ] )

/** String: System Version **/
#define SYSTEM_VERSION ( [[[UIDevice currentDevice ] systemVersion ] integerValue] )

#pragma mark - SCREEN INFORMATION

/** Float: Portrait Screen Height **/
#define SCREEN_HEIGHT_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.height )

/** Float: Portrait Screen Width **/
#define SCREEN_WIDTH_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.width )

/** Float: Landscape Screen Height **/
#define SCREEN_HEIGHT_LANDSCAPE ((SYSTEM_VERSION >=8)?([[UIScreen mainScreen ] bounds ].size.height ):([[UIScreen mainScreen ] bounds ].size.width ))

/** Float: Landscape Screen Width **/
#define SCREEN_WIDTH_LANDSCAPE ((SYSTEM_VERSION >=8)?([[UIScreen mainScreen ] bounds ].size.width ):([[UIScreen mainScreen ] bounds ].size.height ))

/** CGRect: Portrait Screen Frame **/
#define SCREEN_FRAME_PORTRAIT ( CGRectMake( 0, 0, SCREEN_WIDTH_PORTRAIT , SCREEN_HEIGHT_PORTRAIT ) )

/** CGRect: Landscape Screen Frame **/
#define SCREEN_FRAME_LANDSCAPE ( CGRectMake( 0, 0, SCREEN_WIDTH_LANDSCAPE , SCREEN_HEIGHT_LANDSCAPE ) )

/** Float: Screen Scale **/
#define SCREEN_SCALE ([[UIScreen mainScreen] scale ] )

/** CGSize: Screen Size Portrait **/
#define SCREEN_SIZE_PORTRAIT ( CGSizeMake( SCREEN_WIDTH_PORTRAIT * SCREEN_SCALE , SCREEN_HEIGHT_PORTRAIT * SCREEN_SCALE ) )

/** CGSize: Screen Size Landscape **/
#define SCREEN_SIZE_LANDSCAPE ( CGSizeMake( SCREEN_WIDTH_LANDSCAPE * SCREEN_SCALE , SCREEN_HEIGHT_LANDSCAPE * SCREEN_SCALE ) )

#pragma mark - COLOR
/** UIColor: Color From Hex **/

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

/** UIColor: Color from RGB **/
#define colorFromRGB(r, g, b) ( [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1 ] )

#define RGB(r, g, b)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

/** UIColor: Color from RGBA **/

#define colorFromRGBA(r, g, b, a) ( [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a ] )

#define RGBA(r, g, b, a)                [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLOR_HEX                   @"3fb3dd"
#pragma mark - DEGREES, RADIANS

/** Degrees to Radian **/
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )

/** Radians to Degrees **/
#define radiansToDegrees( radians ) ( ( radians ) * ( 180.0 / M_PI ) )

/** Check iPhone5 **/
#define IS_IPHONE_5                     (SCREEN_HEIGHT_PORTRAIT == 568)

#define LSSTRING(str) NSLocalizedString(str, str)

#define NIL_IF_NULL(foo) ((foo == [NSNull null]) ? nil : foo)

#define NULL_IF_NIL(foo) ((foo == nil) ? [NSNull null] : foo)

#define EMPTY_IF_NIL(foo) ((foo == nil) ? @"" : foo)

#define EMPTY_IF_NULL(foo) ((foo == [NSNull null]) ? @"" : foo)

#define EMPTY_IF_NULL_OR_NIL(foo) ((foo == [NSNull null] || foo == nil) ? @"" : foo)

#define EMPTY_STRING_IF_NULL(foo) (([foo isEqualToString:@"(null)"]) ? @"" : foo)

#define SAFETY_TEXT_LEGTH(foo) (foo.length == 0)?@"":foo;

#define SAFETY_TEXT_NIL(foo) (foo == nil)?@"":foo;

#define HEIGHT_STATUSBAR 20
#define HEIGHT_NAVBAR    44
#define HEIGHT_TABBAR    49
#define IPHONE_KEYBOARD_HEIGHT 216
#define IPHONE_KETYBOARD_HEIGHT_LANDSCAPE 162
#define IPAD_KEYBOARD_HEIGHT_PORTRAIT 264
#define IPAD_KEYBOARD_HEIGHT_LANDSCAPE 352

#pragma mark - Dictionary macro
#define _setObjectToDictionary(dict, key, object) if (object != nil) [dict setObject:object forKey:key]

#define _getObjectFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [dict objectForKey:key]
#define _getIntFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] intValue]
#define _getIntegerFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] integerValue]
#define _getFloatFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] floatValue]
#define _getDoubleFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] doubleValue]
#define _getBoolFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] boolValue]
#define _getCharFromDictionary(dict, key, object) if ([dict objectForKey:key]) object = [[dict objectForKey:key] charValue]

#define _removeObjectFromDictionary(dict, key) if ([dict objectForKey:key]) [dict removeObjectForKey:key]

#define kAppDelegate ((AppDelegate *)([[UIApplication sharedApplication].delegate]))
#define APP_FRAME [[UIScreen mainScreen]applicationFrame]

#define Convert_Ratio(x) (IS_IPHONE_5)?x*3.25:x
#define Auto_Convert(x, y) (IS_IPHONE_5)?x:y


#pragma mark - DEFINE

#define NUMBER_OF_PENDING_ORDERS @"NUMBER_OF_PENDING_ORDERS"
#define LEFT_MENU_DID_SHOW @"LEFT_MENU_DID_SHOW"
#define RELOAD_IMAGE_AT_BOTTOM @"RELOAD_IMAGE_AT_BOTTOM"
#endif
