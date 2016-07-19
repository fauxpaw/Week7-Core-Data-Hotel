//
//  ViewController.m
//  Manager
//
//  Created by Michael Sweeney on 7/18/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "ViewController.h"
#import "HotelsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupCustomLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupViewController {
    [self.navigationItem setTitle:@"H & M"];
}

-(void) setupCustomLayout {

    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *bookButton = [[UIButton alloc] init];
    UIButton *lookupButton = [[UIButton alloc] init];
    
    NSMutableArray *buttonArray = [[NSMutableArray alloc]init];
    [buttonArray addObject:browseButton];
    [buttonArray addObject: bookButton];
    [buttonArray addObject:lookupButton];
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor colorWithRed:0.94 green:.51 blue:.40 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:.40 green:0.91 blue:.46 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:.50 green:.40 blue:.84 alpha:1.0]];

    for (UIButton *button in buttonArray) {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
        
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.30 constant:1.0];

        [self.view addSubview:button];
        [self.view addConstraint:leading];
        [self.view addConstraint:trailing];
        [self.view addConstraint:height];

    }
    //margins continued
    NSLayoutConstraint *browseButtonTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:64.0];
    NSLayoutConstraint *bookButtonCenterY = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant: navigationBarHeight / 1.4];
    NSLayoutConstraint *lookupButtonBot = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    bookButtonCenterY.active = YES;
    browseButtonTop.active = YES;
    lookupButtonBot.active = YES;
    
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) browseButtonSelected:(UIButton *)sender {
    
    [self.navigationController pushViewController:[[HotelsViewController alloc] init] animated:YES];
    
}

-(void) bookButtonSelected:(UIButton *)sender {
    
}

-(void) lookupButtonSelected:(UIButton *)sender {
    
}
@end
