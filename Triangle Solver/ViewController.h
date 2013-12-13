//
//  ViewController.h
//  Triangle Solver
//
//  Created by Amit on 12/11/13.
//  Copyright (c) 2013 Cultured Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UITextField *activeField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *sideAB;
@property (weak, nonatomic) IBOutlet UITextField *sideBC;
@property (weak, nonatomic) IBOutlet UITextField *sideCA;
@property (weak, nonatomic) IBOutlet UITextField *angleA;
@property (weak, nonatomic) IBOutlet UITextField *angleB;
@property (weak, nonatomic) IBOutlet UITextField *angleC;
- (IBAction)caculateButton:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)reset:(id)sender;

@end
