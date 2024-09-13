# InMobiCMP Demo - iOS

  

Welcome to the InMobiCMP Demo for iOS. This project demonstrates the integration and usage of InMobi's Consent Management Platform (CMP) in an iOS application.

  

## Table of Contents

  

- [Features](#features)

- [Requirements](#requirements)

- [Installation](#installation)

- [Usage](#usage)

- [Customization](#customization)

- [License](#license)

  

## Features

  

- Initialization of InMobi CMP

- Customizable color themes for light and dark modes

- Handling of various consent types, including GDPR, CCPA, and Google Basic Consent

- Display of US regulations

 
 ## Pre-requisites
 This demo app includes a default bundle ID and an associated p-code. To test various scenarios with your own credentials, you can create an account on the InMobiCMP portal. Follow these steps:
 - Signup and login on the InMobiCMP [portal](https://choice.inmobi.com/)
 - Setup a property with your bundle id and other information
 - Use the same bundle id and p-code in the demo app


## Requirements

  

- iOS 12.0+

- Xcode 15.0+

- Swift 5.0+

  

## Installation

  

1. ****Clone the repository:****

  

```bash

git clone https://github.com/InMobi/InMobiCMP-Demo-iOS.git

cd InMobiCMP-Demo-iOS

```

  

2. ****Install dependencies:****

  

Ensure you have all the necessary dependencies installed. This project uses CocoaPods for dependency management.

```

pod install --repo-update

```

3. ****Open the project:****

  

Open the .xcworkspace file in Xcode.

```

open InMobiCMP-Demo-iOS.xcworkspace

```

## Usage

The main integration points are within the AppDelegate class. Below is a breakdown of the key methods and their functionalities:

  

 - Initialization

The InMobi CMP is initialized in the application(__:didFinishLaunchingWithOptions:) method:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    startChoice()
    return true
}
```

- Custom Colors

The defaultColors property defines the color scheme used by the CMP:

```swift
var defaultColors: ChoiceColor {
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

```

- Starting CMP

The startChoice method sets up and starts the InMobi CMP with the defined colors and themes:

  

```swift
@objc func startChoice() {
    let style = ChoiceStyle(preferredThemeMode: .auto, lightModeColors: defaultColors, darkModeColors: defaultColors)
    ChoiceCmp.shared.startChoice(pcode: "GeHdnS-8pKsAD", delegate: self, gbcDelegate: self, style: style)
}

  

```


- Showing US Regulations Consent
```swift
@objc func showUSRegulations() {
    ChoiceCmp.shared.showUSRegulations(ccpaDelegate: self)
}
```


- Showing Google Basic Consent
```swift
@objc func showGoogleConsent() {
    ChoiceCmp.shared.showGoogleBasicConsent(delegate: self)
}
```

- Get the InMobiCMP SDK Version
```swift
var inMobiCMPVersion: String {
    ChoiceCmp.shared.sdkVersion
}
```

- Delegates

Implement the necessary delegate methods to handle consent responses:

```swift
extension AppDelegate: ChoiceCmpDelegate, CCPADelegate, GoogleBasicConsentDelegate {
    func cmpDidLoad(info: InMobiCMP.PingResponse) {
        print(#function)
        print("US Regulation Applies: \(info.usRegulationApplies)")
    }

    func cmpUIStatusChanged(info: DisplayInfo) {
        print("\(#function), Display Status: \(info.displayStatus)")
        print("\(#function), Display Message: \(info.displayMessage)")
        print("\(#function), Regulation Shown: \(info.regulationShown)")
        print("\(#function), GBC Shown : \(info.gbcShown)")

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

    func didReceiveUSRegulationsConsent(usRegData: USRegulationsData)     {
        print(#function)
    }

    func userDidMoveToOtherState() {
        print(#function)
    }
}
```

  

## Customization

You can customize the colors used in the CMP by modifying the defaultColors property. Adjust the colors as needed to match your application's theme.

  

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

  

By integrating InMobi CMP into your iOS application, you ensure compliance with global privacy regulations while providing a seamless user experience. Happy coding!
