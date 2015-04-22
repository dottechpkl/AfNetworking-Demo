//
//  NSDictionary+weather.m
//  AfNetworking Demo
//
//  Created by Dottechnologies on 5/28/14.
//  Copyright (c) 2014 Dottechnologies. All rights reserved.
//

#import "NSDictionary+weather.h"

@implementation NSDictionary (weather)
-(NSNumber*)cloudCover
{
    NSString *cc=self[@"cloudCover"];
    NSNumber *n=@([cc intValue]);
    return n;
}
-(NSNumber*)humidity
{
    NSString *cc=self[@"humidity"];
    NSNumber *n=@([cc intValue]);
    return n;
}
-(NSNumber*)observationTime
{
    NSString *str=self[@"observation_time"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber *)precipMM
{
    NSString *str=self[@"precipMM"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber*)pressure
{
    NSString *str=self[@"pressure"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber*)tempC
{
    NSString *str=self[@"temp_C"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber*)tempF
{
    NSString *str=self[@"temp_F"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber*)visibility
{
    NSString *str=self[@"visibility"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSNumber*)weatherCode
{
    NSString *str= self[@"weatherCode"];
    NSNumber *n=@([str intValue]);
    return n;
}
-(NSArray*)weatherDesc
{
    NSDictionary *dict =self[@"data"];
    NSArray *arr=dict[@"weatherDesc"];
    return arr[0];
}
-(NSArray*)weatherIconUrl
{
    NSDictionary *dict =self[@"data"];
    NSArray *arr=dict[@"weatherIconUrl"];
    return arr[0];

}
-(NSArray*)weather
{
    NSDictionary *dict =self[@"data"];
    NSArray *arr=dict[@"weather"];
    return arr[0];
}
-(NSArray*)request
{
    NSDictionary *dict =self[@"data"];
    NSArray *arr=dict[@"weatherDesc"];
    return arr[0];

}
-(NSArray*)currentCondition
{
    NSDictionary *dict =self[@"data"];
    NSArray *arr=dict[@"weatherDesc"];
    return arr[0];

}
@end
