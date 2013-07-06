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
    
    [RACAble(self.viewModel.userName) subscribeNext:^(NSString *newName) {
        NSLog(@"User Name : %@", newName);
    }];
    
    
    [[RACAble(self.viewModel.userName)
      filter:^BOOL (NSString *newName) {
          return [newName isEqualToString:@"admin"];
      }]
     subscribeNext:^(NSString *newName) {
         NSLog(@"%@ canot not be a user name", newName);
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
