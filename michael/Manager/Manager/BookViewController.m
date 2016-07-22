//
//  BookViewController.m
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "BookViewController.h"
#import "NSObject+NSManagedObjectContext.h"

@interface BookViewController ()

@property (strong, nonatomic)UITextField *firstNameField;
@property (strong, nonatomic)UITextField *lastNameField;
@property (strong, nonatomic)UITextField *emailField;
@property (strong, nonatomic)UITextField *phoneField;


@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBookViewController];
    [self setupMessageLabel];
    [self setupInputFields];
}

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor: [UIColor whiteColor]];
}

-(void)setupBookViewController{
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

-(void)setupInputFields{
    
    self.firstNameField = [[UITextField alloc] init];
    self.firstNameField.placeholder = @"First Name";
    self.lastNameField = [[UITextField alloc] init];
    self.lastNameField.placeholder = @"Last Name";
    self.emailField = [[UITextField alloc] init];
    self.emailField.placeholder = @"Email";
    self.phoneField = [[UITextField alloc] init];
    self.phoneField.placeholder = @"Phone Number";
    
    NSMutableArray *textFieldArray = [[NSMutableArray alloc]init];
    [textFieldArray addObject:self.firstNameField];
    [textFieldArray addObject:self.lastNameField];
    [textFieldArray addObject:self.emailField];
    [textFieldArray addObject:self.phoneField];
    
    for (UITextField *field in textFieldArray) {
        
        field.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:field attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:field attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
        [self.view addSubview:field];
        field.layer.borderColor = [[UIColor redColor] CGColor];
        field.layer.borderWidth = 2;
        field.layer.cornerRadius = 3.0;
        leading.active = YES;
        trailing.active = YES;
    }
    
    NSLayoutConstraint *firstNameFieldTop = [NSLayoutConstraint constraintWithItem:self.firstNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:84];
    
    NSLayoutConstraint *lastNameFieldTop = [NSLayoutConstraint constraintWithItem:self.lastNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:114];
    
    NSLayoutConstraint *emailFieldTop = [NSLayoutConstraint constraintWithItem:self.emailField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:144];
    
    NSLayoutConstraint *phoneFieldTop = [NSLayoutConstraint constraintWithItem: self.phoneField attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:174];

    firstNameFieldTop.active = YES;
    lastNameFieldTop.active = YES;
    emailFieldTop.active = YES;
    phoneFieldTop.active = YES;

    [self.firstNameField becomeFirstResponder];
    
}

-(void)setupMessageLabel{
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;

    messageLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %i, From: %@ - To:%@", self.room.hotel.name, self.room.number.intValue,[NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle],[NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    NSLog(@"%@", messageLabel.text);
    
    [self.view addSubview:messageLabel];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    centerY.active = YES;
    trailing.active = YES;
    leading.active = YES;
    
}

-(void)saveButtonSelected: (UIBarButtonItem *)sender{
    Reservation *reservation = [Reservation reservationWithStartDate:self.startDate endDate:self.endDate room:self.room];
    self.room.reservation = reservation;
    reservation.guest = [Guest guestWithFields:self.firstNameField.text lastName:self.lastNameField.text email:self.emailField.text phone:self.phoneField.text];

    
    NSError *error;
    [[NSObject managerContext] save:&error];
    
    if (error) {
        NSLog(@"Save error: %@", error);
    }
    else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
