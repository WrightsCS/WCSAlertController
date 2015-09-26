//
//  ViewController.m
//  WCSAlertExample
//
//  Created by Aaron C. Wright on 9/26/15.
//  Copyright © 2015 Wrights Creative Services, L.L.C. All rights reserved.
//
//  aaron@wrightscs.com
//  http://www.wrightscs.com, http://www.wrightscsapps.com
//


#import "WCSAlertController.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonnull, strong, nonatomic) WCSAlertController * controller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (IBAction)simple_action:(id)sender
{
    [WCSAlertController action:NSLocalizedString(@"Simple Action", nil)
                       message:NSLocalizedString(@"This is a simple action with text only.", nil)
                           tag:0
                   destructive:nil
                       buttons:nil
                    controller:self.navigationController
                      animated:YES
                    completion:^(NSInteger buttonIndex) {
                        switch ( buttonIndex ) {
                            case -1: // Cancel
                                NSLog(@"Cancel");
                                break;
                                break;
                        }
                    }];
}

- (IBAction)simple_action_with_button:(id)sender
{
    [WCSAlertController action:NSLocalizedString(@"1-Button Action", nil)
                      message:NSLocalizedString(@"This is a simple action with 1 button.", nil)
                          tag:0
                   destructive:nil
                      buttons:@[ STRING_OK ]
                   controller:self.navigationController
                     animated:YES
                   completion:^(NSInteger buttonIndex) {
                       switch ( buttonIndex ) {
                           case -1: // Cancel
                               NSLog(@"Cancel");
                               break;
                           case 0: // OK
                               NSLog(@"OK");
                               break;
                       }
                    }];
}

- (IBAction)simple_action_destructive:(id)sender
{
    [WCSAlertController action:NSLocalizedString(@"Destructive Action", nil)
                       message:NSLocalizedString(@"This is aa action with a destructive button.", nil)
                           tag:0
                   destructive:@[ NSLocalizedString(@"Destructive", nil) ]
                       buttons:@[ STRING_OK ]
                    controller:self.navigationController
                      animated:YES
                    completion:^(NSInteger buttonIndex) {
                        switch ( buttonIndex ) {
                            case -1: // Cancel
                                NSLog(@"Cancel");
                                break;
                            case 0: // Destructive
                                NSLog(@"Destructive");
                                break;
                            case 1: // OK
                                NSLog(@"OK");
                                break;
                        }
                    }];
}

#pragma mark - Alerts

- (IBAction)alert_simple:(id)sender
{
    [WCSAlertController alert:NSLocalizedString(@"Simple Alert", nil)
                      message:NSLocalizedString(@"This is a simple alert with text only.", nil)
                          tag:0
                       fields:nil
                      buttons:@[ STRING_OK ]
                   controller:self.navigationController
                     animated:YES
                   completion:^(BOOL ok, NSArray * _Nonnull values) {
                       if ( ok )
                           NSLog(@"OK pressed.");
                   }];
}

- (IBAction)alert_simple_cancel_ok:(id)sender
{
    [WCSAlertController alert:NSLocalizedString(@"Simple Alert", nil)
                      message:NSLocalizedString(@"This is a simple alert with a Cancel and OK button.", nil)
                          tag:0
                       fields:nil
                      buttons:@[ STRING_CANCEL, STRING_OK ]
                   controller:nil
                     animated:YES
                   completion:^(BOOL ok, NSArray * _Nonnull values) {
                       if ( ok )
                           NSLog(@"OK pressed.");
                       else
                           NSLog(@"Cancel pressed.");
                   }];
}

- (IBAction)alert_simple_cancel_custom_ok:(id)sender
{
    [WCSAlertController alert:NSLocalizedString(@"Simple Alert", nil)
                      message:NSLocalizedString(@"This is a simple alert with a Cancel and Custom OK button.", nil)
                          tag:0
                       fields:nil
                      buttons:@[ STRING_CANCEL, NSLocalizedString(@"Got it!", nil) ]
                   controller:nil
                     animated:YES
                   completion:^(BOOL ok, NSArray * _Nonnull values) {
                       if ( ok )
                           NSLog(@"Got it! pressed.");
                       else
                           NSLog(@"Cancel pressed.");
                   }];
}


- (IBAction)alert_with_textfield:(id)sender
{
    [WCSAlertController alert:NSLocalizedString(@"UITextField Alert", nil)
                      message:NSLocalizedString(@"This is an alert with a textfield.", nil)
                          tag:0
                       fields:@[ @{ @"text":@"",
                                    @"placeholder":NSLocalizedString(@"Some Placeholder", nil),
                                    @"secure":@NO,
                                    @"keyboard":[NSNumber numberWithInteger:UIKeyboardTypeAlphabet]
                                    } ]
                      buttons:@[ STRING_CANCEL, STRING_OK ]
                   controller:nil
                     animated:YES
                   completion:^(BOOL ok, NSArray * _Nonnull values) {
                       if ( ok )
                           NSLog(@"UITextField value: %@.", values[0]);
                       else
                           NSLog(@"Cancel pressed.");
                   }];
}
- (IBAction)alert_with_textfields:(id)sender
{
    [WCSAlertController alert:NSLocalizedString(@"Login style Alert", nil)
                      message:NSLocalizedString(@"This is an alert with a regular text field and a password field.", nil)
                          tag:0
                       fields:@[ @{ @"text":@"",
                                    @"placeholder":NSLocalizedString(@"Username", nil),
                                    @"secure":@NO,
                                    @"keyboard":[NSNumber numberWithInteger:UIKeyboardTypeAlphabet]
                                    },
                                 @{ @"text":@"",
                                    @"placeholder":NSLocalizedString(@"Password", nil),
                                    @"secure":@YES,
                                    @"keyboard":[NSNumber numberWithInteger:UIKeyboardTypeAlphabet]
                                    }]
                      buttons:@[ STRING_CANCEL, STRING_OK ]
                   controller:nil
                     animated:YES
                   completion:^(BOOL ok, NSArray * _Nonnull values) {
                       if ( ok )
                           NSLog(@"Username: %@, Password: %@", values[0], values[1]);
                       else
                           NSLog(@"Cancel pressed.");
                   }];
}

@end
