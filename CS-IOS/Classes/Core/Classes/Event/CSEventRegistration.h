//
// Created by Rene Dohan on 04/06/14.
// Copyright (c) 2014 creative_studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSEvent;


@interface CSEventRegistration : NSObject
@property(nonatomic, strong) CSEvent *event;

@property(nonatomic, copy) void (^block)();

- (instancetype)construct:(CSEvent *)event :(void (^)())pFunction;

- (void)cancel;
@end