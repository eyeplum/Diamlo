//
//  DBLAppDelegate.m
//  Diamlo
//
//  Created by eyeplum on 9/17/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DBLAppDelegate.h"
#import "AFIncrementalStore.h"
#import "DBLIncrementalStore.h"

@implementation DBLAppDelegate
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

#pragma mark - Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navi_bg"] forBarMetrics:UIBarMetricsDefault];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


- (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark - Core Data

- (NSManagedObjectContext *)managedObjectContext {
    if (__managedObjectContext) {
        return __managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        __managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }

    return __managedObjectContext;
}


- (NSManagedObjectModel *)managedObjectModel {
    if (__managedObjectModel) {
        return __managedObjectModel;
    }

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DBLModel" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    return __managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (__persistentStoreCoordinator) {
        return __persistentStoreCoordinator;
    }

    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];

    AFIncrementalStore *incrementalStore =
            (AFIncrementalStore *) [__persistentStoreCoordinator addPersistentStoreWithType:[DBLIncrementalStore type]
                                                                                          configuration:nil
                                                                                                    URL:nil
                                                                                                options:nil
                                                                                                  error:nil];

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DBL.sqlite"];
    NSDictionary *options = @{
        NSInferMappingModelAutomaticallyOption : @(YES),
        NSMigratePersistentStoresAutomaticallyOption : @(YES)
    };

    NSError *error = nil;
    if (![incrementalStore.backingPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                          configuration:nil
                                                                                    URL:storeURL
                                                                                options:options
                                                                                  error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return __persistentStoreCoordinator;
}


- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
