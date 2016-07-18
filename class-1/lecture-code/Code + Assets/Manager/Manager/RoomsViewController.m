//
//  RoomsViewController.m
//  Manager
//
//  Created by Michael Babiy on 7/18/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

#import "RoomsViewController.h"
#import "Room.h"

@interface RoomsViewController ()

@end

@implementation RoomsViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (Room *room in self.hotel.rooms) {
        NSLog(@"Room number: %@", room.number);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
