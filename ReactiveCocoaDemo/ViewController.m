//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Hari B on 05/07/13.
//  Copyright (c) 2013 Hari B. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.signUpButton.enabled = false;
    
    [self.nameField addTarget:self action:@selector(inputReceived:) forControlEvents:UIControlEventEditingChanged];
    [self.emailField addTarget:self action:@selector(inputReceived:) forControlEvents:UIControlEventEditingChanged];
    [self.confirmEmailField addTarget:self action:@selector(inputReceived:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(inputReceived:) forControlEvents:UIControlEventEditingChanged];
    
    [self.signUpButton addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void) inputReceived:(UITextField *) textField {
    self.signUpButton.enabled = [self isValidInput];
    NSLog(@"%@=%@", textField.placeholder, textField.text);
}

- (BOOL)isValidInput {
    return self.nameField.text.length > 0 && self.emailField.text.length > 0 && self.confirmEmailField.text.length > 0 &&
    self.passwordField.text.length > 0;
}

@end
