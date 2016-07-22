//
//  NSObject+NSManagedObjectContext.h
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSObject (NSManagedObjectContext)

+(NSManagedObjectContext *)managerContext;

@end
