//
//  Pensioner.h
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface Pensioner : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat sacrifice;    // жертвоприношение (для задания Умничка) выполняют все классы


@end
