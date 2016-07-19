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

@property (strong, nonatomic)UITextField *nameField;


@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMessageLabel];
    [self setupNameField];
    
    
}

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor: [UIColor whiteColor]];
}

-(void)setupBookViewController{
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

-(void)setupNameField{
    
    self.nameField = [[UITextField alloc] init];
    self.nameField.placeholder = @"Please enter your name";
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.nameField];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:84];

    leading.active = YES;
    trailing.active = YES;
    top.active = YES;
    
    [self.nameField becomeFirstResponder];
    
}

-(void)setupMessageLabel{
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    //TODO: startdate below
    messageLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %i, From: Today - To:%@", self.room.hotel.name, self.room.number.intValue, [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    [self.view addSubview:messageLabel];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    
    centerY.active = YES;
    trailing.active = YES;
    leading.active = YES;
    
}

-(void)saveButtonSelected: (UIBarButtonItem *)sender{
    //TODO: implement actual start date
    Reservation *reservation = [Reservation reservationWithStartDate:[NSDate date] endDate:self.endDate room:self.room];
    self.room.reservation = reservation;
    reservation.guest = [Guest guestWithName:self.nameField.text];
    
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
