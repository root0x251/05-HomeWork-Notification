//
//  Government.h
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern NSString *const GovernmentTaxLevelDidChangeNotification;
extern NSString *const GovernmentSalsryDidChangeNotification;
extern NSString *const GovernmentPensionDidChangeNotification;
extern NSString *const GovernmentAveragePriceDidChangeNotification;
extern NSString *const GovernmentSacrificeDidChangeNotification;    // жертвоприношение


extern NSString *const GovernmentTaxLevelUserKey;
extern NSString *const GovernmentSalaryUserKey;
extern NSString *const GovernmentPensionUserKey;
extern NSString *const GovernmentAveragePriceUserKey;
extern NSString *const GovernmentSacrificeUserKey;  // жертвоприношение

@interface Government : NSObject

@property (assign, nonatomic) CGFloat taxLevel; // процнтная ставка
@property (assign, nonatomic) CGFloat salary;   // зарплата
@property (assign, nonatomic) CGFloat pension;  // пенсия
@property (assign, nonatomic) CGFloat averagePrice; // средняя цена
@property (assign, nonatomic) NSInteger sacrifice;    // жертвоприношение (для задания Умничка) выполняют все классы

@end
