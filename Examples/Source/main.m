//
//  main.m
//  MustOverride
//
//  Created by Nick Lockwood on 22/02/2015.
//  Copyright (c) 2015 Nick Lockwood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MustOverride.h"


@interface AbstractBaseClass : NSObject

- (void)optionalOverride;
- (void)mustOverride;

@end

@implementation AbstractBaseClass

- (void)optionalOverride
{
    NSLog(@"Optional");
}

- (void)mustOverride
{
    SUBCLASS_MUST_OVERRIDE;

    NSLog(@"Must");
}

@end


@interface ConcreteSubclass : AbstractBaseClass

@end

@implementation ConcreteSubclass

// Doesn't override any methods
// And will crash as a result.

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        AbstractBaseClass *foo = [[AbstractBaseClass alloc] init];
        [foo optionalOverride];
        [foo mustOverride];

        AbstractBaseClass *bar = [[ConcreteSubclass alloc] init];
        [bar optionalOverride];
        [bar mustOverride];
    }
    return 0;
}
