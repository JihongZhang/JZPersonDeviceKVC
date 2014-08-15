//
//  main.m
//  JZPersonDeviceKVC
//
//  Created by jihong zhang on 8/12/14.
//  Copyright (c) 2014 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZPerson.h"
#import "JZAppleDevice.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        JZAppleDevice *mac = [[JZAppleDevice alloc] init];
        [mac setValue:@"macbook" forKey:@"_name"];
        [mac setValue:@800 forKey:@"_price"];
        
        JZAppleDevice *iphone = [[JZAppleDevice alloc] init];
        [iphone setValue:@"iphone" forKey:@"_name"];
        [iphone setValue:@500 forKey:@"_price"];
        
        JZAppleDevice *ipad = [[JZAppleDevice alloc] init];
        [ipad setValue:@"ipad" forKey:@"_name"];
        [ipad setValue:@380 forKey:@"_price"];
        
        NSArray *devices = @[mac, iphone, ipad];
        [mac release];
        [ipad release];
        [iphone release];
        
        JZPerson *person = [[JZPerson alloc] init];
        [person setValue:@"Steve" forKey:@"name"];
        [person setValue:devices forKey:@"devices"];
        
        NSString *totalDevice = [person valueForKeyPath:@"devices.@count.devices"];
        NSString *priceSum = [person valueForKeyPath:@"devices.@sum._price"];
        NSString *avgPrice = [person valueForKeyPath:@"devices.@avg._price"];
        NSString *minPrice = [person valueForKeyPath:@"devices.@min._price"];
        NSString *maxPrice = [person valueForKeyPath:@"devices.@max._price"];
        NSLog(@"%@", totalDevice);
        
        NSLog(@"Totl device for %@: %@, price sum: %@, average price: %@, minPrice: %@, maxPrice: %@", [person valueForKey:@"name"], totalDevice, priceSum, avgPrice, minPrice, maxPrice);

        
        [person release];
        
    }
    return 0;
}

