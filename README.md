# WCSAlertController

UIAlertController example with a few extra parameters and completion block.

## UIAlertControllerStyleActionSheet
    /*!
     *  @param buttons @[ STRING_CANCEL, STRING_OK ]
     *  @param controller SELF for UIViewController, NIL for rootViewController
     *  @param completion VALUES stores textfield values in order
     */
    + (void)action:(NSString*)title
           message:(NSString*)message
               tag:(NSInteger)tag
       destructive:(NSArray*)destructives
           buttons:(NSArray*)buttons
        controller:(UIViewController*)controller
          animated:(BOOL)animated
        completion:(void (^)(NSInteger buttonIndex))completion;

## UIAlertControllerStyleAlert

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
    + (void)alert:(NSString*)title
          message:(NSString*)message
              tag:(NSInteger)tag
           fields:(NSArray*)fields
          buttons:(NSArray*)buttons
       controller:(UIViewController*)controller
         animated:(BOOL)animated
       completion:(void (^)(BOOL ok, NSArray * values))completion;

## Example login style alert

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
