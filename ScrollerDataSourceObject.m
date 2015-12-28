//
//  ScrollerDataSourceObject.m
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import "ScrollerDataSourceObject.h"

@implementation ScrollerDataSourceObject
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
