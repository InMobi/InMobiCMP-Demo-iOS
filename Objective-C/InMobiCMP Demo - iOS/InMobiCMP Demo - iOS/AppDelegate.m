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
    ChoiceColor* defaultColors = [[ChoiceColor alloc] init];
    defaultColors.dividerColor = @"#CCBBFF";
    defaultColors.tabBackgroundColor = @"#BAABEA";
    defaultColors.tabForegroundColor = @"#8844FF";
    defaultColors.searchBarBackgroundColor = @"#CCBBFF";
    defaultColors.searchBarForegroundColor = @"#BAABEA";
    defaultColors.infoButtonForegroundColor = @"#8844FF";
    defaultColors.infoScreenBackgroundColor = @"#CCBBFF";
    defaultColors.infoScreenForegroundColor = @"#5533BB";
    defaultColors.toggleActiveColor = @"#8844FF";
    defaultColors.toggleInactiveColor = @"#CCBBFF";
    defaultColors.globalTextColor = @"#5533BB";
    defaultColors.globalBackgroundColor = @"#EEDDFF";
    defaultColors.titleTextColor = @"#5533BB";
    defaultColors.bodyTextColor = @"#5533BB";
    defaultColors.listTextColor = @"#5533BB";
    defaultColors.tabTextColor = @"#5533BB";
    defaultColors.menuTextColor = @"#5533BB";
    defaultColors.linkTextColor = @"#8844FF";
    defaultColors.buttonTextColor = @"#BAABEA";
    defaultColors.buttonDisabledTextColor = @"#8844FF";
    defaultColors.buttonBackgroundColor = @"#8844FF";
    defaultColors.buttonDisabledBackgroundColor = @"#CCBBFF";
    
    // Use the ChoiceStyle class to set the light and dark themes
    ChoiceStyle *style = [[ChoiceStyle alloc] initWithPreferredThemeMode: CMPUserInterfaceStyleAuto lightModeColors:defaultColors darkModeColors:defaultColors regularFont:NULL boldFont:NULL];
    
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
    NSLog(@"%@", NSStringFromSelector(_cmd), info.gbcShown);
}


@end
