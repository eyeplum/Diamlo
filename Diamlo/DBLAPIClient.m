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
    if ([fetchRequest.entityName isEqualToString:@"Career"]) {
        if (fetchRequest.predicate) {
            NSString *path = [NSString stringWithFormat:@"api/d3/profile/%@/",
                            [self stripPredicateToBattleTag:fetchRequest.predicate]];
            mutableURLRequest = [self getRequestWithPath:path];
        }
    } else {
        mutableURLRequest = [super requestForFetchRequest:fetchRequest
                                              withContext:context];
    }

    return mutableURLRequest;
}


- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                       pathForObjectWithID:(NSManagedObjectID *)objectID
                               withContext:(NSManagedObjectContext *)context {

    return [super requestWithMethod:method
                pathForObjectWithID:objectID
                        withContext:context];
}


- (id)representationOrArrayOfRepresentationsOfEntity:(NSEntityDescription *)entity
                                  fromResponseObject:(id)responseObject {
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                         options:NSJSONReadingMutableContainers error:nil];

    id ro = [super representationOrArrayOfRepresentationsOfEntity:entity
                                               fromResponseObject:json];

    if ([entity.name isEqualToString:@"Hero"]) {
        if ([ro isKindOfClass:[NSDictionary class]]) {
            id value = nil;
            value = [ro valueForKey:@"heroes"];
            if (value) {
                return value;
            }
        }
    }

    return ro;
}


- (NSString *)resourceIdentifierForRepresentation:(NSDictionary *)representation
                                         ofEntity:(NSEntityDescription *)entity
                                     fromResponse:(NSHTTPURLResponse *)response {
    if ([entity.name isEqualToString:@"Career"]) {
        return representation[@"battleTag"];
    }

    return [super resourceIdentifierForRepresentation:representation
                                             ofEntity:entity
                                         fromResponse:response];
}


- (NSDictionary *)attributesForRepresentation:(NSDictionary *)representation
                                     ofEntity:(NSEntityDescription *)entity
                                 fromResponse:(NSHTTPURLResponse *)response {
    NSMutableDictionary *mutablePropertyValues = [[super attributesForRepresentation:representation
                                                                            ofEntity:entity
                                                                        fromResponse:response] mutableCopy];
    if ([entity.name isEqualToString:@"Career"]) {
        mutablePropertyValues[@"lastHeroPlayed"] = representation[@"lastHeroPlayed"];
        mutablePropertyValues[@"lastUpdated"] = representation[@"lastUpdated"];
        mutablePropertyValues[@"battleTag"] = representation[@"battleTag"];
    } else if ([entity.name isEqualToString:@"Hero"]) {
        mutablePropertyValues[@"name"] = representation[@"name"];
        mutablePropertyValues[@"level"] = representation[@"level"];
        mutablePropertyValues[@"heroID"] = representation[@"id"];
        mutablePropertyValues[@"gender"] = representation[@"gender"];
        mutablePropertyValues[@"lastUpdated"] = representation[@"last-updated"];
        mutablePropertyValues[@"dead"] = representation[@"dead"];
        mutablePropertyValues[@"heroClass"] = representation[@"class"];
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


#pragma mark - Helper Methods

- (NSMutableURLRequest *)getRequestWithPath:(NSString *)path {
    return [self requestWithMethod:@"GET" path:path parameters:nil];
}


- (NSString *)stripPredicateToBattleTag:(NSPredicate *)predicate {
    NSString *predicateString = [predicate.predicateFormat stringByReplacingOccurrencesOfString:@"#" withString:@"-"];
    NSString *battleTag = [predicateString stringByReplacingOccurrencesOfString:@"battleTag == " withString:@""];
    battleTag = [battleTag stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    return battleTag;
}


@end