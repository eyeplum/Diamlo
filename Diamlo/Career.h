//
//  Career.h
//  
//
//  Created by eyeplum on 5/15/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Career : NSManagedObject

@property (nonatomic, retain) NSSet *heros;
@end

@interface Career (CoreDataGeneratedAccessors)

- (void)addHerosObject:(NSManagedObject *)value;
- (void)removeHerosObject:(NSManagedObject *)value;
- (void)addHeros:(NSSet *)values;
- (void)removeHeros:(NSSet *)values;

@end
