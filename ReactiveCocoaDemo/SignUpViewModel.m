//
//  SignUpViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Hari B on 06/07/13.
//  Copyright (c) 2013 Hari B. All rights reserved.
//

#import "SignUpViewModel.h"

@implementation SignUpViewModel

- (id)init
{
    self = [super init];
    if (!self) return self;
	
	_userName = @"";
	_password = @"";
    _emailId = @"";
	
    return self;
}


@end
