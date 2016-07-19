//
//  DateViewController.m
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"



@interface DateViewController ()

@property (strong, nonatomic)UIDatePicker *endPicker;
@property (strong, nonatomic)UIDatePicker *startPicker;


@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDateViewController];
    [self setupDatePickers];
    
}

-(void)setupDatePickers{
    self.endPicker = [[UIDatePicker alloc] init];
    self.endPicker.datePickerMode = UIDatePickerModeDate;
    
    self.endPicker.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    [self.view addSubview:self.endPicker];
}

-(void)doneButtonSelected:(UIBarButtonItem *)sender {
    NSDate *endDate = [self.endPicker date];
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"WTF mate" message:@"Please make sure end date is in the future" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.endPicker.date = [NSDate date];
        }];
        
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
        
    }
    
    AvailabilityViewController *availabilityViewController = [[AvailabilityViewController alloc] init];
    
    availabilityViewController.endDate = endDate;

    [self.navigationController pushViewController:availabilityViewController animated:YES];
}

-(void)setupDateViewController{
    
    [self.navigationItem setTitle:@"Select End Date"];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];
}


-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}



@end
