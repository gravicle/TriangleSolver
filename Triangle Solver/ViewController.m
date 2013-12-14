//
//  ViewController.m
//  Triangle Solver
//
//  Created by Amit on 12/11/13.
//  Copyright (c) 2013 Cultured Pixel. All rights reserved.
//

#import "ViewController.h"
#import "TriangleCalculator.h"

@interface ViewController ()

- (NSDictionary *)switch:(NSDictionary *)measures;
- (int)fieldsCheckSum:(NSDictionary *)measures;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.scrollView.frame = CGRectMake(0, 0, 320, 568);
    [self.scrollView setContentSize:CGSizeMake(320, 568)];
    [self registerForKeyboardNotifications];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//---------------------KEYBOARD STUFF---------------------//

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    double keyboardHeight = kbSize.height + 25.0;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardHeight, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardHeight;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets =UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

//Managing the active text field
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}

//---------------------END KEYBOARD STUFF---------------------//

#pragma mark - Calculator Methods

- (int)fieldsCheckSum:(NSDictionary *)measures
{
    int counter = 0;
    NSArray *fields = [measures allValues];
    for (NSString *field in fields) {
        if ([field length] > 0 ) {
            counter += 1;
        }
        else
        {
            counter += 0;
        }
    }
    return counter;
}
- (NSDictionary *)switch:(NSDictionary *)measures
{
    TriangleCalculator *triangleSolver = [[TriangleCalculator alloc] init];
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] init];
    
    // Decompressing the dictionary
    NSString *ab = [measures valueForKey:@"sideAB"];
    NSString *bc = [measures valueForKey:@"sideBC"];
    NSString *ca = [measures valueForKey:@"sideCA"];
    NSString *a = [measures valueForKey:@"angleA"];
    NSString *b = [measures valueForKey:@"angleB"];
    NSString *c = [measures valueForKey:@"angleC"];
    
    if ( [a length] > 0 && [b length] > 0 && [c length] > 0)
    {
        calculatedMeasures = [triangleSolver calcAAA:measures];
    }
    else if (([a length] > 0 && [b length] > 0 && ([bc length] > 0 || [ca length] > 0)) || ([b length] > 0 && [c length] > 0 && ([ab length] > 0 || [ca length] > 0)) || ([c length] > 0 && [a length] > 0 && ([bc length] > 0 || [ab length] > 0)))
    {
        calculatedMeasures = [triangleSolver calcAAS:measures];
    }
    else if (([a length] > 0 && [b length] > 0 && [ab length] > 0) || ([b length] > 0 && [c length] > 0 && [bc length] > 0) || ([c length] > 0 && [a length] > 0 && [ca length] > 0))
    {
        calculatedMeasures = [triangleSolver calcASA:measures];
    }
    else if (([ab length] > 0 && [bc length] > 0 && [b length] > 0) || ([bc length] > 0 && [ca length] > 0 && [c length] > 0) || ([ca length] > 0 && [ab length] > 0 && [a length] > 0))
    {
        calculatedMeasures = [triangleSolver calcSAS:measures];
    }
    else if (([ab length] > 0 && [bc length] > 0 && ([c length] > 0 || [a length] > 0)) || ([bc length] > 0 && [ca length] > 0 && ([a length] > 0 || [b length] > 0)) || ([ca length] > 0 && [ab length] > 0 && ([b length] > 0 || [a length] > 0)))
    {
        calculatedMeasures = [triangleSolver calcSSA:measures];
    }
    else if ( [ab length] > 0 && [bc length] > 0 && [ca length] > 0)
    {
        calculatedMeasures = [triangleSolver calcSSS:measures];
    }
    
    return calculatedMeasures;
}

- (void)calc {
    NSDictionary *measures = [[NSDictionary alloc] initWithObjectsAndKeys:self.sideAB.text, @"sideAB", self.sideBC.text, @"sideBC", self.sideCA.text, @"sideCA", self.angleA.text, @"angleA", self.angleB.text, @"angleB", self.angleC.text, @"angleC", nil];
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] init];
    int fieldCheckSum = [self fieldsCheckSum:measures];
    if (fieldCheckSum < 3) {
        self.errorLabel.text = @"Enter 3 values";
    }
    else if (fieldCheckSum > 4) {
        self.errorLabel.text = @"Enter only 3 values";
    }
    else {
        calculatedMeasures = [self switch:measures];
        // updating text-fields
        self.sideAB.text = [calculatedMeasures valueForKey:@"sideAB"];
        self.sideBC.text = [calculatedMeasures valueForKey:@"sideBC"];
        self.sideCA.text = [calculatedMeasures valueForKey:@"sideCA"];
        self.angleA.text = [calculatedMeasures valueForKey:@"angleA"];
        self.angleB.text = [calculatedMeasures valueForKey:@"angleB"];
        self.angleC.text = [calculatedMeasures valueForKey:@"angleC"];
        self.errorLabel.text = [calculatedMeasures valueForKey:@"error"];
    }
}

- (IBAction)caculateButton:(id)sender
{
    [self.sideAB resignFirstResponder];
    [self.sideBC resignFirstResponder];
    [self.sideCA resignFirstResponder];
    [self.angleA resignFirstResponder];
    [self.angleB resignFirstResponder];
    [self.angleC resignFirstResponder];
    [self calc];
}

- (IBAction)done:(id)sender {
    [self.sideAB resignFirstResponder];
    [self.sideBC resignFirstResponder];
    [self.sideCA resignFirstResponder];
    [self.angleA resignFirstResponder];
    [self.angleB resignFirstResponder];
    [self.angleC resignFirstResponder];
    [self calc];
}

- (IBAction)reset:(id)sender {
    self.sideAB.text = @"";
    self.sideBC.text = @"";
    self.sideCA.text = @"";
    self.angleA.text = @"";
    self.angleB.text = @"";
    self.angleC.text = @"";
    self.errorLabel.text = @"";
}


@end
