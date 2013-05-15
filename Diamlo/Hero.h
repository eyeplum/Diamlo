//
//  Hero.h
//  
//
//  Created by eyeplum on 5/15/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Career;

@interface Hero : NSManagedObject

@property (nonatomic, retain) NSNumber * dead;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * hardcore;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * lastUpdated;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Career *career;

@end
