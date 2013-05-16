//
//  Career.h
//  Diamlo
//
//  Created by Yan Li on 5/16/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hero;

@interface Career : NSManagedObject

@property (nonatomic, retain) NSNumber * lastHeroPlayed;
@property (nonatomic, retain) NSNumber * lastUpdated;
@property (nonatomic, retain) NSString * battleTag;
@property (nonatomic, retain) NSSet *heros;
@end

@interface Career (CoreDataGeneratedAccessors)

- (void)addHerosObject:(Hero *)value;
- (void)removeHerosObject:(Hero *)value;
- (void)addHeros:(NSSet *)values;
- (void)removeHeros:(NSSet *)values;

@end
