//
//  Guest.m
//  Manager
//
//  Created by Michael Sweeney on 7/18/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Guest.h"
#import "Reservation.h"
#import "NSObject+NSManagedObjectContext.h"

@implementation Guest

+(instancetype)guestWithName: (NSString *)name{
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:delegate.managedObjectContext];
    
    guest.name = name;
    
    return guest;
}

@end
