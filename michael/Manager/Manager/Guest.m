//
//  Guest.m
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "Guest.h"
#import "Reservation.h"
#import "AppDelegate.h"

@implementation Guest

+(instancetype)guestWithFields: (NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email {
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:delegate.managedObjectContext];
    
    guest.firstName = firstName;
    guest.lastName = lastName;
    guest.email = email;
    
    return guest;
}
@end
