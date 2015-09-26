//
//  WCSAlertExampleController.m
//  WCSAlertExample
//
//  Created by Aaron C. Wright on 9/26/15.
//  Copyright © 2015 Wrights Creative Services, L.L.C. All rights reserved.
//
//  aaron@wrightscs.com
//  http://www.wrightscs.com, http://www.wrightscsapps.com
//

#import "WCSAlertController.h"

@implementation WCSAlertController

#pragma mark - Shared Alert

+ (WCSAlertController*)sharedAlert
{
    static WCSAlertController * singleton;
    static dispatch_once_t singleToken;
    dispatch_once(&singleToken, ^{
        singleton = [[WCSAlertController alloc] init];
    });
    return singleton;
}
- (id)init
{
    if ( ( self = [super init] ) ) {
        ;
    }
    return self;
}

#pragma mark - Public Methods

+ (void)action:(NSString* _Nullable)title
       message:(NSString* _Nullable)message
           tag:(NSInteger)tag
   destructive:(NSArray* _Nullable)destructives
       buttons:(NSArray* _Nullable)buttons
    controller:(UIViewController* _Nullable)controller
      animated:(BOOL)animated
    completion:(void (^ _Nullable)(NSInteger buttonIndex))completion;
{
    UIAlertController * _action = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    _action.view.tag = tag;
    
    if ( buttons == nil )
    {
        [_action addAction:[UIAlertAction actionWithTitle:STRING_OK style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * action) {
                                                      
                                                      completion(1);
                                                      
                                                      [_action dismissViewControllerAnimated:animated completion:nil];
                                                  }]];
    }
    else
    {
        NSInteger _buttonIndex = 0;
        for ( NSString * destructive in destructives )
        {
            [_action addAction:[UIAlertAction actionWithTitle:destructive style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction * action) {
                                                          
                                                          completion(_buttonIndex);
                                                          
                                                          [_action dismissViewControllerAnimated:animated completion:nil];
                                                      }]];
            _buttonIndex++;
        }
        
        for ( NSString * button in buttons )
        {
            [_action addAction:[UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                                                          
                                                          completion(_buttonIndex);
                                                          
                                                          [_action dismissViewControllerAnimated:animated completion:nil];
                                                      }]];
            _buttonIndex++;
        }
        
        [_action addAction:[UIAlertAction actionWithTitle:STRING_CANCEL style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * action) {
                                                      
                                                      completion(-1);
                                                      
                                                      [_action dismissViewControllerAnimated:animated completion:nil];
                                                  }]];
    }
    
    [( controller != nil ? controller : [WCSAlertController rootController] ) presentViewController:_action animated:animated completion:nil];
}

+ (void)alert:(NSString*)title
      message:(NSString*)message
          tag:(NSInteger)tag
       fields:(NSArray*)fields
      buttons:(NSArray*)buttons
   controller:(UIViewController*)controller
     animated:(BOOL)animated
   completion:(void (^)(BOOL ok, NSArray * values))completion
{
    UIAlertController * _alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    _alert.view.tag = tag;
    
    NSMutableArray * _textFieldValues = [NSMutableArray new];
    
    if ( fields != nil )
    {
        for ( NSDictionary * field in fields )
        {
            [_alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.text = field[@"text"];
                textField.placeholder = field[@"placeholder"];
                textField.secureTextEntry = [field[@"secure"] boolValue];
                textField.keyboardType = [field[@"keyboard"] integerValue];
                textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
                textField.autocorrectionType = UITextAutocorrectionTypeYes;
                textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            }];
        }
    }
    
    if ( buttons == nil )
    {
        [_alert addAction:[UIAlertAction actionWithTitle:STRING_OK style:UIAlertActionStyleCancel
                                                 handler:^(UIAlertAction * action) {
                                                     
                                                     for ( UITextField * _textField in _alert.textFields ) {
                                                         if ( _textField.text != nil ||
                                                             [_textField.text isEqualToString:@""] ||
                                                             [_textField.text isEqualToString:@" "])
                                                             [_textFieldValues addObject:_textField.text];
                                                     }
                                                     completion(YES, _textFieldValues);
                                                     
                                                     [_alert dismissViewControllerAnimated:animated completion:nil];
                                                 }]];
    }
    else
    {
        for ( NSString * button in buttons )
        {
            if ( [button isEqualToString:STRING_OK] |[button isEqualToString:STRING_YES] )
            {
                [_alert addAction:[UIAlertAction actionWithTitle:STRING_OK style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             for ( UITextField * _textField in _alert.textFields ) {
                                                                 if ( _textField.text != nil ||
                                                                     [_textField.text isEqualToString:@""] ||
                                                                     [_textField.text isEqualToString:@" "])
                                                                     [_textFieldValues addObject:_textField.text];
                                                             }
                                                             completion(YES, _textFieldValues);
                                                             
                                                             [_alert dismissViewControllerAnimated:animated completion:nil];
                                                         }]];
            }
            
            else if ( [button isEqualToString:STRING_CANCEL] || [button isEqualToString:STRING_NO] )
            {
                [_alert addAction:[UIAlertAction actionWithTitle:STRING_CANCEL style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             for ( UITextField * _textField in _alert.textFields ) {
                                                                 if ( _textField.text != nil ||
                                                                     [_textField.text isEqualToString:@""] ||
                                                                     [_textField.text isEqualToString:@" "])
                                                                     [_textFieldValues addObject:_textField.text];
                                                             }
                                                             completion(NO, _textFieldValues);
                                                             
                                                             [_alert dismissViewControllerAnimated:animated completion:nil];
                                                         }]];
            }
            else
            {
                [_alert addAction:[UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             for ( UITextField * _textField in _alert.textFields ) {
                                                                 if ( _textField.text != nil ||
                                                                     [_textField.text isEqualToString:@""] ||
                                                                     [_textField.text isEqualToString:@" "])
                                                                     [_textFieldValues addObject:_textField.text];
                                                             }
                                                             completion(YES, _textFieldValues);
                                                             
                                                             [_alert dismissViewControllerAnimated:animated completion:nil];
                                                         }]];
            }
        }
    }
    
    [( controller != nil ? controller : [WCSAlertController rootController] ) presentViewController:_alert animated:animated completion:nil];
}


#pragma mark - Utilities

+ (id)rootController {
    return [[[UIApplication sharedApplication] keyWindow] rootViewController];
}

@end
