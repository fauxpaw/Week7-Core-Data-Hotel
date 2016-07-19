//
//  Guest.h
//  Manager
//
//  Created by Michael Sweeney on 7/19/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

NS_ASSUME_NONNULL_BEGIN

@interface Guest : NSManagedObject

+(instancetype)guestWithFields: (NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email;


@end

NS_ASSUME_NONNULL_END

#import "Guest+CoreDataProperties.h"
