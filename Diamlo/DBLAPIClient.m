//
// Created by eyeplum on 5/15/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DBLAPIClient.h"


static NSString * const kDBLAPIBaseURLString = @"http://us.battle.net/api/d3/profile/";


@implementation DBLAPIClient

+ (DBLAPIClient *)sharedClient {
    static DBLAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kDBLAPIBaseURLString]];
    });

    return _sharedClient;
}


- (id)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"appliction/json"];
    }

    return self;
}


#pragma mark - AFIncrementalStore

- (NSDictionary *)attributesForRepresentation:(NSDictionary *)representation
                                     ofEntity:(NSEntityDescription *)entity
                                 fromResponse:(NSHTTPURLResponse *)response {
    NSMutableDictionary *mutablePropertyValues = [[super attributesForRepresentation:representation
                                                                            ofEntity:entity
                                                                        fromResponse:response] mutableCopy];
    if ([entity.name isEqualToString:@"Career"]) {
        // ...
    }

    return mutablePropertyValues;
}


- (BOOL)shouldFetchRemoteAttributeValuesForObjectWithID:(NSManagedObjectID *)objectID
                                 inManagedObjectContext:(NSManagedObjectContext *)context {
    return NO;
}


- (BOOL)shouldFetchRemoteValuesForRelationship:(NSRelationshipDescription *)relationship
                               forObjectWithID:(NSManagedObjectID *)objectID
                        inManagedObjectContext:(NSManagedObjectContext *)context {
    return NO;
}

@end