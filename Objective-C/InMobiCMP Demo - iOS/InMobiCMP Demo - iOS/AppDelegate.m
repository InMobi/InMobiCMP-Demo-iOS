//
//  AppDelegate.m
//  InMobiCMP Demo - iOS
//
//  Copyright © 2024 InMobi. All rights reserved.
//

#import "AppDelegate.h"
#import <InMobiCMP/InMobiCMP.h>

@interface AppDelegate ()<ChoiceCmpDelegate,CCPADelegate, GoogleBasicConsentDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Get InMobiCMP SDK version
    NSLog(@"InMobiCMP SDK Version: %@", [[ChoiceCmp shared] sdkVersion]);
    // Initialise InMobiCMP
    [self startChoice];
    
    return YES;
}


- (void)startChoice {
    ChoiceColor* darkColors = [[ChoiceColor alloc] init];
        darkColors.dividerColor = @"#292929"; // Dark Gray
        darkColors.tabBackgroundColor = @"#090909"; // Almost Black
        darkColors.searchBarBackgroundColor = @"#121212"; // Deep Black
        darkColors.searchBarForegroundColor = @"#5C5C5C"; // Muted Gray
        darkColors.infoButtonForegroundColor = @"#FFDD33"; // Bright Yellow
        darkColors.toggleActiveColor = @"#F70D80"; // Neon Pink
        darkColors.toggleInactiveColor = @"#3A3A3A"; // Dark Gray
        darkColors.globalBackgroundColor = @"#040404"; // Pure Black
        darkColors.titleTextColor = @"#FFB700"; // Golden Yellow
        darkColors.bodyTextColor = @"#AFAFAF"; // Light Gray
        darkColors.tabTextColor = @"#FFFFFF"; // White
        darkColors.menuTextColor = @"#FF8C00"; // Vibrant Orange
        darkColors.linkTextColor = @"#08F7FE"; // Neon Blue
        darkColors.buttonTextColor = @"#000000"; // Black
        darkColors.buttonDisabledTextColor = @"#303030"; // Dark Gray
        darkColors.buttonBackgroundColor = @"#F70D80"; // Neon Pink
        darkColors.buttonDisabledBackgroundColor = @"#252525"; // Darker Gray

        ChoiceColor *lightColors = [[ChoiceColor alloc] init];
        lightColors.dividerColor = @"#807060"; // Brownish Gray
        lightColors.tabBackgroundColor = @"#2F261B"; // Deep Brown
        lightColors.searchBarBackgroundColor = @"#504030"; // Dark Sand
        lightColors.searchBarForegroundColor = @"#AA9275"; // Muted Beige
        lightColors.infoButtonForegroundColor = @"#D48F1A"; // Deep Gold
        lightColors.toggleActiveColor = @"#D92B2B"; // Blood Red
        lightColors.toggleInactiveColor = @"#85776A"; // Warm Gray
        lightColors.globalBackgroundColor = @"#3E3225"; // Dark Tan
        lightColors.titleTextColor = @"#F2B705"; // Bright Gold
        lightColors.bodyTextColor = @"#E0B18A"; // Soft Orange
        lightColors.tabTextColor = @"#F2E6D0"; // Creamy White
        lightColors.menuTextColor = @"#F2A74B"; // Burnt Orange
        lightColors.linkTextColor = @"#E65C3C"; // Fiery Red
        lightColors.buttonTextColor = @"#140C07"; // Deep Brown
        lightColors.buttonDisabledTextColor = @"#645548"; // Muted Brown
        lightColors.buttonBackgroundColor = @"#C72C41"; // Crimson Red
        lightColors.buttonDisabledBackgroundColor = @"#7D6957"; // Warm Gray
    
    // Use the ChoiceStyle class to set the light and dark themes
    ChoiceStyle *style = [[ChoiceStyle alloc] initWithPreferredThemeMode: CMPUserInterfaceStyleAuto lightModeColors:lightColors darkModeColors:darkColors regularFont:NULL boldFont:NULL];
    
    // Initialise InMobi CMP
    [[ChoiceCmp shared] startChoiceWithPcode:@"GeHdnS-8pKsAD" delegate: self ccpaDelegate: self shouldDisplayIDFA:true style: style];
    
}

- (void)startCCPA:(UIButton *) sender {
    // Start ChoiceCMP
    [[ChoiceCmp shared] showCCPAWithCcpaDelegate: self];
}

- (void)showUSRegulations:(UIButton *) sender {
    // Show US Regulations popup
    [[ChoiceCmp shared] showUSRegulationsWithCcpaDelegate: self];
}

- (void)forceDisplay:(UIButton *) sender {
    // Force display GDPR popup
    [[ChoiceCmp shared] forceDisplayUI];
}

- (void)showGoogleConsent:(UIButton *) sender {
    // Show Google consent
    [[ChoiceCmp shared] showGoogleBasicConsentWithDelegate: self];
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}


- (void)cmpDidErrorWithError:(NSError * _Nonnull)error {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)cmpDidLoadWithInfo:(PingResponse * _Nonnull)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)cmpDidShowWithInfo:(PingResponse * _Nonnull)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveAdditionalConsentWithAcData:(ACData * _Nonnull)acData updated:(BOOL)updated {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveIABVendorConsentWithGdprData:(GDPRData * _Nonnull)gdprData updated:(BOOL)updated {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveNonIABVendorConsentWithNonIabData:(NonIABData * _Nonnull)nonIabData updated:(BOOL)updated {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveCCPAConsentWithString:(NSString * _Nonnull)string {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveGoogleBasicConsentChangeWithConsents:(GoogleBasicConsents *)consents {
    NSLog(@"Ad storage value: %ld", consents.adStorage);
    NSLog(@"Ad user data value: %ld", consents.adUserData);
    NSLog(@"Ad personalization value: %ld", consents.adPersonalization);
    NSLog(@"Analytics storage value: %ld", consents.analyticsStorage);
    
}

- (void)didReceiveUSRegulationsConsentWithUsRegData:(USRegulationsData *)usRegData {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)userDidMoveToOtherState {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)cmpUIStatusChangedWithInfo:(DisplayInfo * _Nonnull)info { 
    NSLog(@"%@, gbcShown: %d", NSStringFromSelector(_cmd), info.gbcShown);
}

- (void)didReceiveActionButtonTapWithAction:(enum ActionButtons)action {
    NSLog(@"%@, action button pressed: %ld", NSStringFromSelector(_cmd), action);

}

@end
