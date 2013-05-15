//
// Created by eyeplum on 5/15/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DBLIncrementalStore.h"
#import "DBLAPIClient.h"


@implementation DBLIncrementalStore

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}


+ (NSString *)type {
    return NSStringFromClass(self);
}


+ (NSManagedObjectModel *)model {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"DBLModel" withExtension:@"xcdatamodeld"]];
}


- (AFHTTPClient <AFIncrementalStoreHTTPClient> *)HTTPClient {
    return [DBLAPIClient sharedClient];
}

@end