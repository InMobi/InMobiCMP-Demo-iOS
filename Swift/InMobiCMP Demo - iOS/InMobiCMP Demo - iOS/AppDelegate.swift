//
//  AppDelegate.swift
//  InMobiCMP Demo - iOS
//
//  Copyright © 2024 InMobi. All rights reserved.
//

import UIKit
import InMobiCMP

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var darkColors: ChoiceColor {
        let choiceColor = ChoiceColor()
        choiceColor.dividerColor = "#292929" // Dark Gray
        choiceColor.tabBackgroundColor = "#090909" // Almost Black
        choiceColor.searchBarBackgroundColor = "#121212" // Deep Black
        choiceColor.searchBarForegroundColor = "#5C5C5C" // Muted Gray
        choiceColor.infoButtonForegroundColor = "#FFDD33" // Bright Yellow
        choiceColor.toggleActiveColor = "#F70D80" // Neon Pink
        choiceColor.toggleInactiveColor = "#3A3A3A" // Dark Gray
        choiceColor.globalBackgroundColor = "#040404" // Pure Black
        choiceColor.titleTextColor = "#FFB700" // Golden Yellow
        choiceColor.bodyTextColor = "#AFAFAF" // Light Gray
        choiceColor.tabTextColor = "#FFFFFF" // White
        choiceColor.menuTextColor = "#FF8C00" // Vibrant Orange
        choiceColor.linkTextColor = "#08F7FE" // Neon Blue
        choiceColor.buttonTextColor = "#000000" // Black
        choiceColor.buttonDisabledTextColor = "#303030" // Dark Gray
        choiceColor.buttonBackgroundColor = "#F70D80" // Neon Pink
        choiceColor.buttonDisabledBackgroundColor = "#252525" // Darker Gray
        return choiceColor
    }

    var lightColors: ChoiceColor {
        let choiceColor = ChoiceColor()
        choiceColor.dividerColor = "#807060" // Brownish Gray
        choiceColor.tabBackgroundColor = "#2F261B" // Deep Brown
        choiceColor.searchBarBackgroundColor = "#504030" // Dark Sand
        choiceColor.searchBarForegroundColor = "#AA9275" // Muted Beige
        choiceColor.infoButtonForegroundColor = "#D48F1A" // Deep Gold
        choiceColor.toggleActiveColor = "#D92B2B" // Blood Red
        choiceColor.toggleInactiveColor = "#85776A" // Warm Gray
        choiceColor.globalBackgroundColor = "#3E3225" // Dark Tan
        choiceColor.titleTextColor = "#F2B705" // Bright Gold
        choiceColor.bodyTextColor = "#E0B18A" // Soft Orange
        choiceColor.tabTextColor = "#F2E6D0" // Creamy White
        choiceColor.menuTextColor = "#F2A74B" // Burnt Orange
        choiceColor.linkTextColor = "#E65C3C" // Fiery Red
        choiceColor.buttonTextColor = "#140C07" // Deep Brown
        choiceColor.buttonDisabledTextColor = "#645548" // Muted Brown
        choiceColor.buttonBackgroundColor = "#C72C41" // Crimson Red
        choiceColor.buttonDisabledBackgroundColor = "#7D6957" // Warm Gray
        return choiceColor
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Get InMobiCMP SDK Version
        print("InMobiCMP SDK Version: \(ChoiceCmp.shared.sdkVersion)")
        
        // Initalise InMobi CMP
        startChoice()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    @objc func startChoice() {
        // Use the ChoiceStyle class to set the light and dark themes
        let style = ChoiceStyle(preferredThemeMode: .auto, lightModeColors: lightColors, darkModeColors: darkColors)
        // Initialise InMobi CMP
        ChoiceCmp.shared.startChoice(pcode: "GeHdnS-8pKsAD", delegate: self, gbcDelegate: self, style: style)
        
    }
    
    @objc func startCCPA() {
        // Start ChoiceCMP
        ChoiceCmp.shared.showCCPA(ccpaDelegate: self)
    }
    
    @objc func showGoogleConsent() {
        ChoiceCmp.shared.showGoogleBasicConsent(delegate: self)
    }
    
    @objc func forceDisplayPopup() {
        // Force display GDPR popup
        ChoiceCmp.shared.forceDisplayUI()
    }
    
    @objc func showUSRegulations() {
        ChoiceCmp.shared.showUSRegulations(ccpaDelegate: self)
    }
    
}

extension AppDelegate: ChoiceCmpDelegate, CCPADelegate, GoogleBasicConsentDelegate {
    func cmpDidLoad(info: InMobiCMP.PingResponse) {
        print("\(#function), usRegulationApplies: \(info.usRegulationApplies)")
    }
    
    func cmpUIStatusChanged(info: InMobiCMP.DisplayInfo) {
        print(#function)
    }
    
    func didReceiveIABVendorConsent(gdprData: InMobiCMP.GDPRData, updated: Bool) {
        print(#function)
    }
    
    func didReceiveNonIABVendorConsent(nonIabData: InMobiCMP.NonIABData, updated: Bool) {
        print(#function)
    }
    
    func didReceiveAdditionalConsent(acData: InMobiCMP.ACData, updated: Bool) {
        print(#function)
    }
    
    func cmpDidError(error: Error) {
        print(#function)
    }
    
    func didReceiveCCPAConsent(string: String) {
        print(#function)
    }
    
    func didReceiveGoogleBasicConsentChange(consents: GoogleBasicConsents) {
        print(#function)
        print("AdStorage value: \(consents.adStorage)")
        print("Ad personalization value: \(consents.adPersonalization)")
        print("Ad user data value: \(consents.adUserData)")
        print("Analytics storage value: \(consents.analyticsStorage)")
    }
    
    func didReceiveUSRegulationsConsent(usRegData: USRegulationsData) {
        print(#function)
    }
    
    func userDidMoveToOtherState() {
        print(#function)
    }
    
    func didReceiveActionButtonTap(action: ActionButtons) {
        print("\(#function), action button tapped: \(action)")
    }
}
