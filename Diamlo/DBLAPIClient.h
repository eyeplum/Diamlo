//
// Created by eyeplum on 5/15/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "AFRESTClient.h"


@interface DBLAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (DBLAPIClient *)sharedClient;

@end