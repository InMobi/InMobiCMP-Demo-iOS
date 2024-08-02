//
//  ViewController.swift
//  InMobiCMP Demo - iOS
//
//  Copyright © 2024 InMobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forceDisplayPopup: UIButton! {
        didSet {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                forceDisplayPopup.addTarget(appDelegate, action: #selector(appDelegate.forceDisplayPopup), for: .touchUpInside)
            }
        }
    }
    
    @IBOutlet weak var showCCPA: UIButton! {
        didSet {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                showCCPA.addTarget(appDelegate, action: #selector(appDelegate.startCCPA), for: .touchUpInside)
            }
        }
    }
    
    @IBOutlet weak var showGoogleConsent: UIButton! {
        didSet {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                showGoogleConsent.addTarget(appDelegate, action: #selector(appDelegate.showGoogleConsent), for: .touchUpInside)
            }
        }
    }
    
    @IBOutlet weak var showUSRegulations: UIButton! {
        didSet {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                showUSRegulations.addTarget(appDelegate, action: #selector(appDelegate.showUSRegulations), for: .touchUpInside)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

