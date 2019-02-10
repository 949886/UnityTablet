//
//  TabletUtils.m
//  Test
//
//  Created by YaeSakura on 2019/2/10.
//

#import "TabletUtils.h"
#import "WacomTabletDriver.h"

@implementation TabletUtils 

+ (NSString *) nameOfPen:(NSUInteger)serialNumber byLastUsedTablet: (UInt32) lastUsedTablet
{
    UInt32                  transducerCount   = [WacomTabletDriver transducerCountForTablet:lastUsedTablet];
    NSAppleEventDescriptor  *routingTable     = nil;
    NSAppleEventDescriptor    *nameDesc            = nil;
    NSAppleEventDescriptor    *serialNumberDesc    = nil;
    UInt32                  counter           = 0;
    NSString                        *name                    = nil;
    
    // Search the transducers for the matching serial number.
    for(counter = 1; counter <= transducerCount && name == nil; counter++)
    {
        // Retrieve pen info.
        // Note:    Transducer data is not available through a context. We access the data directly from the tablet.
        routingTable      = [WacomTabletDriver routingTableForTablet:lastUsedTablet transducer:counter];
        nameDesc          = [WacomTabletDriver dataForAttribute:pName ofType:typeUTF8Text routingTable:routingTable];
        serialNumberDesc  = [WacomTabletDriver dataForAttribute:pSerialNumber ofType:typeUInt32 routingTable:routingTable];
        
        if((UInt32)[serialNumberDesc int32Value] == serialNumber)
        {
            name = [nameDesc stringValue];
        }
    }
    
    return name;
    
}

@end
