//
//  WeatherForecastViewController.m
//  WeatherForecast
//
//  Created by Lixing Zhang on 20/08/13.
//  Copyright (c) 2013 Lixing Zhang. All rights reserved.
//

#import "WeatherForecastViewController.h"
#import "WeatherForecast.h"
#import "Location.h"    

@interface WeatherForecastViewController ()

@end

@implementation WeatherForecastViewController

@synthesize currentLocation, cityLabel, weatherImage, weatherLabel, centigradeLabel, fahrenheitLabel, humidityLabel, windLabel, refreshButton,loadingActivityIndicator, forecast;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self refreshView:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshView:(id)sender {
    [loadingActivityIndicator startAnimating];
    WeatherForecast *locationForecast = [[WeatherForecast alloc] init];
    self.forecast = locationForecast;
    [self.forecast queryServiceWithCountry:currentLocation.country                                                               andCity:currentLocation.city
                                withParent:self];
    
    [self setTitle:currentLocation.city];
}


- (void)updateView{
    [loadingActivityIndicator stopAnimating];
}

@end
