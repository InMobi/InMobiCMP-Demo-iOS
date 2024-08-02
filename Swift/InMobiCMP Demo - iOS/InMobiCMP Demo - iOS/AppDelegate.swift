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
    var defaultColors : ChoiceColor {
        let choiceColor = ChoiceColor()
        choiceColor.dividerColor = "#CCBBFF"
        choiceColor.tabBackgroundColor = "#BAABEA"
        choiceColor.tabForegroundColor = "#8844FF"
        choiceColor.searchBarBackgroundColor = "#CCBBFF"
        choiceColor.searchBarForegroundColor = "#BAABEA"
        choiceColor.infoButtonForegroundColor = "#8844FF"
        choiceColor.infoScreenBackgroundColor = "#CCBBFF"
        choiceColor.infoScreenForegroundColor = "#5533BB"
        choiceColor.toggleActiveColor = "#8844FF"
        choiceColor.toggleInactiveColor = "#CCBBFF"
        choiceColor.globalTextColor = "#5533BB"
        choiceColor.globalBackgroundColor = "#EEDDFF"
        choiceColor.titleTextColor = "#5533BB"
        choiceColor.bodyTextColor = "#5533BB"
        choiceColor.listTextColor = "#5533BB"
        choiceColor.tabTextColor = "#5533BB"
        choiceColor.menuTextColor = "#5533BB"
        choiceColor.linkTextColor = "#8844FF"
        choiceColor.buttonTextColor = "#BAABEA"
        choiceColor.buttonDisabledTextColor = "#8844FF"
        choiceColor.buttonBackgroundColor = "#8844FF"
        choiceColor.buttonDisabledBackgroundColor = "#CCBBFF"
        return choiceColor
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
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
        let style = ChoiceStyle(preferredThemeMode: .auto, lightModeColors: defaultColors, darkModeColors: defaultColors)
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
        print(#function)
    }
    
    func cmpDidShow(info: InMobiCMP.PingResponse) {
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
}
