//
//  Hero.h
//  Diamlo
//
//  Created by Yan Li on 5/16/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Career;

@interface Hero : NSManagedObject

@property (nonatomic, retain) NSNumber * dead;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * hardcore;
@property (nonatomic, retain) NSNumber * heroID;
@property (nonatomic, retain) NSNumber * lastUpdated;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Career *career;

@end
