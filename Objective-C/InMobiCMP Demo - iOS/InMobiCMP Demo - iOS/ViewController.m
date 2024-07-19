//
//  ViewController.m
//  InMobiCMP Demo - iOS
//
//  Copyright © 2024 InMobi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *forceDisplayPopup;
@property (weak, nonatomic) IBOutlet UIButton *showCCPA;
@property (weak, nonatomic) IBOutlet UIButton *showGoogleConsent;
@property (weak, nonatomic) IBOutlet UIButton *showUSRegulations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if(appDelegate != NULL) {
        [_forceDisplayPopup addTarget:appDelegate action:@selector(forceDisplay:) forControlEvents:UIControlEventTouchUpInside];
        [_showCCPA addTarget:appDelegate action:@selector(startCCPA:) forControlEvents:UIControlEventTouchUpInside];
        [_showGoogleConsent addTarget:appDelegate action:@selector(showGoogleConsent:) forControlEvents:UIControlEventTouchUpInside];
        [_showUSRegulations addTarget:appDelegate action:@selector(showUSRegulations:) forControlEvents:UIControlEventTouchUpInside];
    }

}


@end
