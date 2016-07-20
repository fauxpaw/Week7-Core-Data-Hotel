//
//  NSObject+NSManagedObjectContext.m
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import "NSObject+NSManagedObjectContext.h"
#import "AppDelegate.h"

@implementation NSObject (NSManagedObjectContext)

+(NSManagedObjectContext *)managerContext{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    return delegate.managedObjectContext;
}


@end
