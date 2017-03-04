//
//  Government.m
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Government.h"

NSString *const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString *const GovernmentSalsryDidChangeNotification = @"GovernmentSalsryDidChangeNotification";
NSString *const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString *const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";
NSString *const GovernmentSacrificeDidChangeNotification = @"GovernmentsacrificeDidChangeNotification";


NSString *const GovernmentTaxLevelUserKey = @"GovernmentTaxLevelDidChangeUserKey";
NSString *const GovernmentSalaryUserKey = @"GovernmentSalaryDidChangeUserKey";
NSString *const GovernmentPensionUserKey = @"GovernmentPensionDidChangeUserKey";
NSString *const GovernmentAveragePriceUserKey = @"GovernmentAveragePriceDidChangeUserKey";
NSString *const GovernmentSacrificeUserKey = @"GovernmentSacrificeUserKey";  // жертвоприношение


@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 0;
        self.salary = 0;
        self.pension = 0;
        self.averagePrice = 0;
        self.sacrifice = 0;

    }
    return self;
}
 

- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel]
                                                           forKey:GovernmentTaxLevelUserKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil userInfo:dictionary];
}

- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary]
                                                           forKey:GovernmentSalaryUserKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalsryDidChangeNotification
                                                        object:nil userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension]
                                                           forKey:GovernmentPensionUserKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice]
                                                           forKey:GovernmentAveragePriceUserKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil userInfo:dictionary];
}

- (void) setSacrifice:(NSInteger)sacrifice {
    _sacrifice = sacrifice;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:sacrifice]
                                                           forKey:GovernmentSacrificeUserKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSacrificeDidChangeNotification
                                                        object:nil userInfo:dictionary];
}

@end
