//
//  Career.h
//  Diamlo
//
//  Created by Yan Li on 5/17/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class Hero;

@interface Career : NSManagedObject

@property (nonatomic, retain) NSString * battleTag;
@property (nonatomic, retain) NSNumber * lastHeroPlayed;
@property (nonatomic, retain) NSNumber * lastUpdated;
@property (nonatomic, retain) NSSet *heroes;
@end

@interface Career (CoreDataGeneratedAccessors)

- (void)addHeroesObject:(Hero *)value;
- (void)removeHeroesObject:(Hero *)value;
- (void)addHeroes:(NSSet *)values;
- (void)removeHeroes:(NSSet *)values;

@end
