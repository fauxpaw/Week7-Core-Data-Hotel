//
//  Reservation+CoreDataProperties.h
//  Manager
//
//  Created by Michael Babiy on 7/18/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Reservation.h"

NS_ASSUME_NONNULL_BEGIN

@interface Reservation (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *endDate;
@property (nullable, nonatomic, retain) NSDate *startDate;
@property (nullable, nonatomic, retain) Room *room;
@property (nullable, nonatomic, retain) Guest *guest;

@end

NS_ASSUME_NONNULL_END
