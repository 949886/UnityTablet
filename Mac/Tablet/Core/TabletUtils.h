//
//  TabletUtils.h
//  Test
//
//  Created by YaeSakura on 2019/2/10.
//

#import <Foundation/Foundation.h>

@interface TabletUtils : NSObject 

+ (NSString *) nameOfPen:(NSUInteger)serialNumber byLastUsedTablet: (UInt32) lastUsedTablet;

@end
