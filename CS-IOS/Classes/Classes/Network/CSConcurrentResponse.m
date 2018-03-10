//
//  Created by Rene Dohan on 1/12/13.
//


#import "CSResponse.h"
#import "CSConcurrentResponse.h"
#import "NSObject+CSExtension.h"
#import "NSArray+CSExtension.h"
#import "NSMutableArray+CSExtension.h"
#import "CSLang.h"


@implementation CSConcurrentResponse {
    CSResponse *_mainResponse;
    NSMutableArray *_failedResponses;
}

- (id)init {
    if (self = [super init]) {
        _failedResponses = NSMutableArray.new;
        _responses = NSMutableArray.new;
    }
    return self;
}

- (instancetype)construct:(NSArray *)responses {
    super.construct;
    for (CSResponse *response in responses) [self add:response];
    return self;
}

- (CSResponse *)add:(CSResponse *)response {
    if (_responses.empty)_mainResponse = response;
    __weak CSResponse *wResponse = [_responses add:response];
    return [[response onFailed:^(CSResponse *failedResponse) {
        [self onResponseFailed:wResponse];
    }] onSuccess:^(id data) {
        [self onResponseSuccess:wResponse];
    }];
}

- (void)onResponseSuccess:(CSResponse *)response {
    if ([_responses remove:response].empty) self.onResponsesDone;
}

- (void)onResponseFailed:(CSResponse *)failedResponse {
    if ([_responses remove:[_failedResponses add:failedResponse]].empty) self.onResponsesDone;
}

- (void)cancel {
    for (CSResponse *response in _responses) response.cancel;
    super.cancel;
}

- (void)reset {
    super.reset;
    _responses.removeAllObjects;
    _failedResponses.removeAllObjects;
}

- (void)onAddDone {
    invoke(^{
        if (_responses.empty)self.onResponsesDone;
    });
}

- (void)onResponsesDone {
    if (_failedResponses.hasItems) [self failed:self];
    else if (_mainResponse) [self success:_mainResponse.data];
    else [self success:nil];
}
@end