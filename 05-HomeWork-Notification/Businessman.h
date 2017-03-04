//
//  Businessman.h
//  05-HomeWork-Notification
//
//  Created by Slava on 04.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface Businessman : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;

@end
