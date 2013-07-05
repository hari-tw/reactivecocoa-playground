//
//  ViewController.h
//  ReactiveCocoaDemo
//
//  Created by Hari B on 05/07/13.
//  Copyright (c) 2013 Hari B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *confirmEmailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UIButton *signUpButton;



- (BOOL)textFieldShouldReturn:(UITextField *)textField;

-(IBAction) signUp;
@end
