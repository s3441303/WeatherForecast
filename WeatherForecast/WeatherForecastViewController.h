//
//  WeatherForecastViewController.h
//  WeatherForecast
//
//  Created by Lixing Zhang on 20/08/13.
//  Copyright (c) 2013 Lixing Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "WeatherForecast.h"

@interface WeatherForecastViewController : UIViewController

@property (nonatomic, strong) Location *currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *centigradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fahrenheitLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
@property (strong, nonatomic) WeatherForecast *forecast;

- (IBAction)refreshView:(id)sender;

- (void)updateView;

@end
