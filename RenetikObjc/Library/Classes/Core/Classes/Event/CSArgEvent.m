//
//  Created by Rene Dohan on 12/30/12.
//


#import "CSArgEvent.h"
#import "CSLang.h"
#import "CSEventRegistered.h"
#import "NSMutableArray+CSExtension.h"

@implementation CSArgEvent {
    NSMutableArray<CSEventBlock> *_blockArray;
}

- (id)init {
    if (self = super.init) _blockArray = NSMutableArray.new;
    return self;
}

- (void)fire {
    [self fire:nil];
}

- (void)fire:(id)argument {
    for (CSEventBlock block in _blockArray)
        block(argument, [CSEventRegistered.new construct:self :block]);
}

- (CSEventRegistered *)add:(CSEventBlock)block {
    let blockCopy = (CSEventBlock) [block copy];
    [_blockArray put:blockCopy];
    return [CSEventRegistered.new construct:self :blockCopy];
}

- (void)remove:(CSEventBlock)block {
    [_blockArray removeObject:block];
}

@end
