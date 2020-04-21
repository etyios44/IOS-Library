//
//  FileChoiceViewController.m
//  Library
//
//  Created by eric on 21/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import "FileChoiceViewController.h"
#import "RootTableTableViewController.h"

@interface FileChoiceViewController ()

@end

@implementation FileChoiceViewController
//private property
@synthesize ourTextField;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        RootTableTableViewController *destinationVC = segue.destinationViewController;
        // connector call via secondviewcontroller
        Connector *coClass = [[Connector alloc] init];
        //connector public properties
        coClass.stringBeingPassed = ourTextField.text;
        NSLog(@"ourTextField.text : %@", ourTextField.text);
        coClass.secondString = @"test second string";
        // push object to secondviewcontroller
        destinationVC.connectorClass = coClass;
    }
}

@end
