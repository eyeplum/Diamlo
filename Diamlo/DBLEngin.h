//
//  DBLEngin.h
//  Diamlo
//
//  Created by eyeplum on 9/18/12.
//  Copyright (c) 2012 eyeplum. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface DBLEngin : MKNetworkEngine

typedef void (^CareerResponseBlock)(NSDictionary *career);
typedef void (^ProfileResponseBlock)(NSArray *heros);
typedef void (^HeroResponseBlock)(NSDictionary *hero);
typedef void (^ItemResponseBlock)(NSDictionary *item);

- (void)getBattleTagCareer:(NSString *)battleTag onCompletion:(CareerResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock;

- (void)getBattleTagProfile:(NSString *)battleTag onCompletion:(ProfileResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock;

- (void)getHeroWithID:(NSString *)heroID andBattleTag:(NSString *)battleTag onCompletion:(HeroResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock;

- (void)getItemDetail:(NSString *)tooltipParams onCompletion:(ItemResponseBlock)responsBlock onError:(MKNKErrorBlock)errorBlock;

@end
