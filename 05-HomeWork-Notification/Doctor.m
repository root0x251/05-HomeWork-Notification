//
//  Doctor.m
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor

// подписываем доктора на NSNotificationCenter
#pragma mark - Init Obj
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(salaryChangedNotification:)
                                                     name:GovernmentSalsryDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sacrificeNotification:)
                                                     name:GovernmentSacrificeDidChangeNotification object:nil];
    }
    return self;
}

// отписываемся

#pragma mark - Remove Observer
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:GovernmentTaxLevelDidChangeNotification];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentSalaryUserKey]; // значение value = значение userInfo от ключа GovernmentSalaryUserKey
    CGFloat salary = [value floatValue]; // переменная salary = значению, что выдает класс Government
    NSLog(@"=====Зарплата у класса Doctor=====");
    if (salary < self.salary) {
        NSLog(@"Doctor %@ are NOT happy, его зарплата = %.1f, была = %.1f", self.name, salary, self.salary);
    } else {
        NSLog(@"Doctor %@ are happy, его зарплата = %.1f, была = %.1f", self.name, salary, self.salary);
    }
    self.salary = salary;   // собственная зарплата равна той, что изменит государство
}

- (void) averagePriceChangedNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentAveragePriceUserKey];
    CGFloat averagePrice = [value floatValue];
    if (averagePrice > self.averagePrice) {
        NSLog(@"Doctor %@ are NOT happy, его средняя цена = %.1f, была = %.1f", self.name, averagePrice, self.averagePrice);
    } else {
        NSLog(@"Doctor %@ are happy, его средняя цена = %.1f, была = %.1f", self.name, averagePrice, self.averagePrice);
    }
    self.averagePrice = averagePrice;
}


// жертвоприношение
- (void) sacrificeNotification: (NSNotification *) notification {
    NSLog(@"®®®®ЖЕРТВОПРИНОШЕНИЕ®®®®");
    NSNumber *value = [notification.userInfo objectForKey:GovernmentSacrificeUserKey];
    NSInteger sacrifice = [value integerValue];
    CGFloat priceBull = self.averagePrice;  // цена бычка
    CGFloat balanceSalary = self.salary - sacrifice * priceBull;            // остаток по зарплате
    NSLog(@"государство сказало мне, %@ - нести %ld бычков",self.name , sacrifice);
    if (self.salary <= 0) {
        NSLog(@"мне придется умереть, поскольку государство велело мне принести в жертву %ld бычков, цена одного %.2f, остаток по зарплате будет %.2f ", sacrifice, priceBull, balanceSalary);
    } else {
        NSLog(@"восславься же кровавое госцдарство, количество бычков - %ld, цена бычка - %.2f, остаток по зарплате - %.2f", sacrifice, priceBull, balanceSalary);
    }
    self.sacrifice = sacrifice;

}
@end
