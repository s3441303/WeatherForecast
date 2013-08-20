//
//  WeatherForecast.m
//  WeatherForecast
//
//  Created by Lixing Zhang on 20/08/13.
//  Copyright (c) 2013 Lixing Zhang. All rights reserved.
//

#import "WeatherForecast.h"
#import "WeatherForecastViewController.h"

@implementation WeatherForecast

@synthesize location, icon, condition, centigrade, fahrenheit, humidity, wind;

- (void)queryServiceWithCountry:(NSString *)country
                        andCity:(NSString *)city
                     withParent:(UIViewController *)controller {
    viewController = (WeatherForecastViewController *)controller;
    responseData = [NSMutableData data];
    apiKey = @"15b07b649a265b3f";
    
    NSString *url = [NSString stringWithFormat:
                     @"http://api.wunderground.com/api/%@/conditions/q/%@/%@.json",
                     apiKey, country, city];
    theURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:theURL];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (theConnection) {
        responseData = [NSMutableData data];
    }else{
        NSLog(@"failed");
    }
}

#pragma mark NSURLConnection Delegate Methods
- (NSURLRequest *)connection:(NSURLConnection *)connection
             willSendRequest:(NSURLRequest *)request
            redirectResponse:(NSURLResponse *)redirectResponse {
    @autoreleasepool {
        theURL = [request URL];
    }
    return request;
}
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}
- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:
(NSError *)error {
    NSLog( @"Error = %@", error );
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *content =
    [[NSString alloc] initWithBytes:[responseData bytes]
                             length:[responseData length]
                           encoding:NSUTF8StringEncoding];
    NSLog( @"Data = %@", content );
    
    //    ...Insert code to parse the content here...
    
    [viewController updateView];
}



@end
