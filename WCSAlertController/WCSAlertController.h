//
//  WCSAlertExampleController.h
//  WCSAlertExample
//
//  Created by Aaron C. Wright on 9/26/15.
//  Copyright © 2015 Wrights Creative Services, L.L.C. All rights reserved.
//
//  aaron@wrightscs.com
//  http://www.wrightscs.com, http://www.wrightscsapps.com
//

@import UIKit;
@import Foundation;


#define STRING_OK       NSLocalizedString(@"OK", nil)
#define STRING_CANCEL   NSLocalizedString(@"Cancel", nil)
#define STRING_YES      NSLocalizedString(@"Yes", nil)
#define STRING_NO       NSLocalizedString(@"No", nil)


@interface WCSAlertController : NSObject

+ (WCSAlertController * _Nullable)sharedAlert;
+ (id _Nullable)rootController;

/*!
 *  @param buttons @[ STRING_CANCEL, STRING_OK ]
 *  @param controller SELF for UIViewController, NIL for rootViewController
 *  @param completion VALUES stores textfield values in order
 */
+ (void)action:(NSString* _Nullable)title
       message:(NSString* _Nullable)message
           tag:(NSInteger)tag
   destructive:(NSArray* _Nullable)destructives
       buttons:(NSArray* _Nullable)buttons
    controller:(UIViewController* _Nullable)controller
      animated:(BOOL)animated
    completion:(void (^ _Nullable)(NSInteger buttonIndex))completion;

/*!
 *  @param fields @[ @{ @"text":@"string", 
                        @"placeholder":@"string", 
                        @"secure":@NO, ,
                        @"keyboard":[NSNumber numberWithInteger:UIKeyboardTypeAlphabet] 
                        } ]
 *  @param buttons @[ STRING_CANCEL, STRING_OK ]
 *  @param controller SELF for UIViewController, NIL for rootViewController
 *  @param completion VALUES stores textfield values in order
 */
+ (void)alert:(NSString* _Nullable)title
      message:(NSString* _Nullable)message
          tag:(NSInteger)tag
       fields:(NSArray* _Nullable)fields
      buttons:(NSArray* _Nullable)buttons
   controller:(UIViewController* _Nullable)controller
     animated:(BOOL)animated
   completion:(void (^ _Nullable)(BOOL ok, NSArray * _Nullable values))completion;


@end

