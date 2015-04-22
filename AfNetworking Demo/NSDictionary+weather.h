//
//  NSDictionary+weather.h
//  AfNetworking Demo
//
//  Created by Dottechnologies on 5/28/14.
//  Copyright (c) 2014 Dottechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (weather)
-(NSNumber*)cloudCover;
-(NSNumber*)humidity;
-(NSNumber*)observationTime;
-(NSNumber *)precipMM;
-(NSNumber*)pressure;
-(NSNumber*)tempC;
-(NSNumber*)tempF;
-(NSNumber*)visibility;
-(NSNumber*)weatherCode;
-(NSArray*)weatherDesc;
-(NSArray*)weatherIconUrl;
-(NSArray*)weather;
-(NSArray*)request;
-(NSArray*)currentCondition;

@end
