//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Hari B on 05/07/13.
//  Copyright (c) 2013 Hari B. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain) SignUpViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.signUpButton.enabled = false;
    
    _viewModel = [SignUpViewModel new];
    
    [self.nameField.rac_textSignal subscribe:RACBind(self.viewModel.userName)];
    [self.emailField.rac_textSignal subscribe:RACBind(self.viewModel.emailId)];
    [self.passwordField.rac_textSignal subscribe:RACBind(self.viewModel.password)];
    
    RAC(self.signUpButton, enabled) = [RACSignal
                                      combineLatest:@[RACAble(self.viewModel.userName),RACAble(self.viewModel.password),RACAble(self.viewModel.emailId)
                                                       ] reduce:^(NSString *username, NSString *password, NSString *emailId) {
                                                          return @(username.length > 0 && password.length > 0 && emailId.length > 0);
                                                      }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField*) textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)signUp
{
     NSLog(@"call the signup api");
}

- (BOOL)isValidInput {
    return self.nameField.text.length > 0 && self.emailField.text.length > 0 && self.confirmEmailField.text.length > 0 &&
    self.passwordField.text.length > 0;
}

@end
