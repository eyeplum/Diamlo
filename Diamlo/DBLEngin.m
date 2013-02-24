//
//  DBLEngin.m
//  Diamlo
//
//  Created by eyeplum on 9/18/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "DBLEngin.h"

@implementation DBLEngin

- (void)getBattleTagCareer:(NSString *)battleTag onCompletion:(CareerResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"api/d3/profile/%@/", battleTag]];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [completedOperation responseJSON];
        responsBlock(response);
    } onError:^(NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getBattleTagProfile:(NSString *)battleTag onCompletion:(ProfileResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"api/d3/profile/%@/", battleTag]];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [completedOperation responseJSON];
        responsBlock([response objectForKey:@"heroes"]);
    } onError:^(NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getHeroWithID:(NSString *)heroID andBattleTag:(NSString *)battleTag onCompletion:(HeroResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"api/d3/profile/%@/hero/%@", battleTag, heroID]];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [completedOperation responseJSON];
        responsBlock(response);
    } onError:^(NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getItemDetail:(NSString *)tooltipParams onCompletion:(ItemResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock;
{
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"api/d3/data/%@", tooltipParams]];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [completedOperation responseJSON];
        responsBlock(response);
    } onError:^(NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

@end
