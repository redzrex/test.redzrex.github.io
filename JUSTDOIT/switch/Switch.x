#import <Flipswitch/Flipswitch.h>
#import <objc/runtime.h>

extern CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void);

@interface JUSTDOITSwitch : NSObject <FSSwitchDataSource>
@end

@implementation JUSTDOITSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
        return @"JUST DO IT";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
    //NSLog(@"DO IT ENABLED: %d",(int)[[objc_getClass("JUSTDOITController") performSelector:@selector(sharedInstance)] performSelector:@selector(enabled)]);
    return [[objc_getClass("JUSTDOITController") performSelector:@selector(sharedInstance)] performSelector:@selector(enabled)] ? FSSwitchStateOn : FSSwitchStateOff;
}

@end