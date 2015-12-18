//
//  DCDCLove.m
//  DauCungDuoc
//
//  Created by mac on 12/10/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//

#import "DCDCLove.h"

@implementation DCDCLove
@synthesize minValue, maxValue, midValue, value;

- (NSString *) description {
    
    return [NSString stringWithFormat:@"%i | %f, %f, %f", self.value, self.minValue, self.midValue, self.maxValue];
    
}
@end
