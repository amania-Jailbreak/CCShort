#import "CCShort.h"
NSString* appbundle = @"";
static void loadPrefs() {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:ROOT_PATH_NS(@"/var/mobile/Library/Preferences/jp.amania.ccshortpreference.plist")];
    appbundle = ( [settings objectForKey:@"appbundle"] ? [settings objectForKey:@"appbundle"] : appbundle );
}
@implementation ControleCenter

// Most third-party Control Center modules out there use non-CAML approach because it's easier to get icon images than create CAML
// Choose either CAML and non-CAML portion of the code for your final implementation of the toggle
// IMPORTANT: To prepare your icons and configure the toggle to its fullest, check out CCSupport Wiki: https://github.com/opa334/CCSupport/wiki

#pragma mark - CAML approach

// CAML descriptor of your module (.ca directory)
// Read more about CAML here: https://medium.com/ios-creatix/apple-make-your-caml-format-a-public-api-please-9e10ba126e9d
- (CCUICAPackageDescription *)glyphPackageDescription {
    return [CCUICAPackageDescription descriptionForPackageNamed:@"ControleCenter" inBundle:[NSBundle bundleForClass:[self class]]];
}

#pragma mark - End CAML approach

#pragma mark - Non-CAML approach

// Icon of your module
- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

// Optional: Icon of your module, once selected 
- (UIImage *)selectedIconGlyph {
    return [UIImage imageNamed:@"icon-selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

// Selected color of your module
- (UIColor *)selectedColor {
    return [UIColor blueColor];
}

#pragma mark - End Non-CAML approach

// Current state of your module
- (BOOL)isSelected {
    return NO;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        loadPrefs();
        NSString *payPayScheme = appbundle;
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:payPayScheme]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:payPayScheme] options:@{} completionHandler:nil];
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSMutableDictionary* dict = [NSMutableDictionary dictionary];
                [dict setObject: @"CCShort" forKey: (__bridge NSString*)kCFUserNotificationAlertHeaderKey];
                [dict setObject: @"URL is wrong" forKey: (__bridge NSString*)kCFUserNotificationAlertMessageKey];
                [dict setObject: @"Close" forKey:(__bridge NSString*)kCFUserNotificationDefaultButtonTitleKey];
                SInt32 error = 0;
                CFUserNotificationRef alert = CFUserNotificationCreate(NULL, 0, kCFUserNotificationPlainAlertLevel, &error, (__bridge CFDictionaryRef)dict);
                CFRelease(alert);
            });
        }
    }}

@end
