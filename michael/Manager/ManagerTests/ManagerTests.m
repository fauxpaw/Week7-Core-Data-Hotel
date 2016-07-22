//
//  ManagerTests.m
//  ManagerTests
//
//  Created by Michael Sweeney on 7/21/16.
//  Copyright © 2016 Michael Sweeney. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+NSManagedObjectContext.h"


@interface ManagerTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation ManagerTests

- (void)setUp {
    [super setUp];
    [self setContext:[NSManagedObjectContext managerContext]];
    
}

- (void)tearDown {
    [self setContext:nil];
    [super tearDown];
}

-(void)testContextCreation {
    XCTAssertNotNil(self.context, @"context should not be nil. Check context");
}

-(void)testContextOnMainQ{
    XCTAssertTrue(self.context.concurrencyType == NSMainQueueConcurrencyType, @"context should be on the main Q!!! Tom foolery!");
}

-(void)testCoreDataSave{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    
    NSError *error;
    NSArray *result = [self.context executeFetchRequest:request error:&error];
    NSNumber *count = result.firstObject;
    
    XCTAssertNil(error, @"error preforming request");
    XCTAssertNotNil(result, "result array shold not be nil");
    XCTAssertTrue(count.intValue > 0, @"number of objects should not be 0!!");
}



@end
