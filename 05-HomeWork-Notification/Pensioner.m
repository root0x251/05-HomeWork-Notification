//
//  Pensioner.m
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"
@implementation Pensioner

#pragma mark - Notification

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pensionChangetdNotification:)
                                                     name: GovernmentPensionDidChangeNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}
#pragma mark - Remove Observer
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification
- (void) pensionChangetdNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentPensionUserKey];
    CGFloat pension = [value floatValue];
    NSLog(@"===Пенсии у класса Pensioner");
    if (pension < self.pension) {
        NSLog(@"Pensioner %@, are NOT happy, её пенсия = %.1f, старая пенсия = %.1f", self.name, pension, self.pension);
    } else {
        NSLog(@"Pensioner %@, are HAPPY, её пенсия = %.1f, старая пенсия = %.1f", self.name, pension, self.pension);
    }
    self.pension = pension;
}

- (void) averagePriceChangedNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentAveragePriceUserKey];
    CGFloat averagePrice = [value floatValue];
    NSLog(@"===Средняя цена у класса Pensioner");
    if (averagePrice > self.averagePrice) {
        NSLog(@"Pensioner %@, are NOT happy, средняя цена = %.1f, старая средняя цена = %.1f", self.name, averagePrice, self.averagePrice);
    } else {
        NSLog(@"Pensioner %@, are HAPPY, средняя цена = %.1f, старая средняя цена = %.1f", self.name, averagePrice, self.averagePrice);    }
    self.averagePrice = averagePrice;
}


@end
