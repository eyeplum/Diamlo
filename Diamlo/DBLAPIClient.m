//
// Created by eyeplum on 5/15/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DBLAPIClient.h"


static NSString * const kDBLAPIBaseURLString = @"http://us.battle.net/";


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

- (NSMutableURLRequest *)requestForFetchRequest:(NSFetchRequest *)fetchRequest
                                    withContext:(NSManagedObjectContext *)context {
    NSMutableURLRequest *mutableURLRequest = nil;
    if ([fetchRequest.entityName isEqualToString:@"Hero"]) {
        mutableURLRequest = [self requestWithMethod:@"GET"
                                               path:@"api/d3/profile/jackfrost-1841/"
                                         parameters:nil];
        NSLog(@"%@", mutableURLRequest.URL);
    }

    return mutableURLRequest;
}


- (id)representationOrArrayOfRepresentationsFromResponseObject:(id)responseObject {
    return [responseObject valueForKey:@"heroes"];
}


- (id)representationOrArrayOfRepresentationsOfEntity:(NSEntityDescription *)entity
                                  fromResponseObject:(id)responseObject
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                         options:NSJSONReadingMutableContainers error:nil];

    id ro = [super representationOrArrayOfRepresentationsOfEntity:entity
                                               fromResponseObject:json];

    if ([ro isKindOfClass:[NSDictionary class]]) {
        id value = nil;
        value = [ro valueForKey:@"heroes"];
        if (value) {
            return value;
        }
    }

    return ro;
}


- (NSDictionary *)attributesForRepresentation:(NSDictionary *)representation
                                     ofEntity:(NSEntityDescription *)entity
                                 fromResponse:(NSHTTPURLResponse *)response {
    NSMutableDictionary *mutablePropertyValues = [[super attributesForRepresentation:representation
                                                                            ofEntity:entity
                                                                        fromResponse:response] mutableCopy];
    if ([entity.name isEqualToString:@"Hero"]) {
        [mutablePropertyValues setValue:[representation valueForKey:@"name"] forKey:@"name"];
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