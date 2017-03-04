//
//  Businessman.m
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"
@implementation Businessman

#pragma mark - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(taxLevelChangetNotification:)
                                                     name:GovernmentTaxLevelDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangetNotification:)
                                                     name:GovernmentSalsryDidChangeNotification
                                                   object:nil];
    }
    return self;
}
#pragma mark - Remove
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification 
- (void) taxLevelChangetNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentTaxLevelUserKey];
    CGFloat taxLevel = [value floatValue];
    NSLog(@"===Процентная ставка для класса Businessman");
    if (taxLevel > self.taxLevel) {
        NSLog(@"Businessman %@, are NOT happy, процентная ставка = %.1f, старая процентная ставка = %.1f", self.name, taxLevel , self.taxLevel);
    } else {
        NSLog(@"Businessman %@, are happy, процентная ставка = %.1f, старая процентная ставка = %.1f", self.name, taxLevel, self.taxLevel);
    }
    self.taxLevel = taxLevel;
}

- (void) salaryChangetNotification: (NSNotification *) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentSalaryUserKey];
    CGFloat salary = [value floatValue];
    NSLog(@"===Зарплата для класса Businessman");
    if (salary < self.salary) {
        NSLog(@"Businessman %@, are NOT happy, старая зарплата = %.1f, новая зарплата = %.1f", self.name, salary, self.salary);
    } else {
        NSLog(@"Businessman %@, are happy, старая зарплата = %.1f, новая зарплата = %.1f", self.name, salary, self.salary);
    }
    self.salary = salary;
}
@end
