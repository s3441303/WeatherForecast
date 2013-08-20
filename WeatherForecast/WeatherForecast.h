//
//  WeatherForecast.h
//  WeatherForecast
//
//  Created by Lixing Zhang on 20/08/13.
//  Copyright (c) 2013 Lixing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherForecastViewController;

@interface WeatherForecast : NSObject {

    //Parent View Controller
    WeatherForecastViewController *viewController;
    
    //weather Underground Service
    NSString *apiKey;
    NSMutableData *responseData;
    NSURL *theURL;

}

//Information

@property (nonatomic, weak) NSString *location;

//current conditions
@property (nonatomic, weak) NSString *icon;
@property (nonatomic, weak) NSString *condition;

@property (nonatomic, weak) NSString *centigrade;
@property (nonatomic, weak) NSString *fahrenheit;
@property (nonatomic, weak) NSString *humidity;
@property (nonatomic, weak) NSString *wind;

- (void)queryServiceWithCountry:(NSString *)country
                        andCity:(NSString *)city
                     withParent:(UIViewController *)controller;


@end
