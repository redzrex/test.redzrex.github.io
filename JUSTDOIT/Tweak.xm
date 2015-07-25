#import <libactivator/libactivator.h>
#include <dlfcn.h>
#import <objc/runtime.h>

typedef enum {
	kEnable
} JUSTDOITActivatorMode;

@interface JUSTDOITListener : NSObject <LAListener>{
	JUSTDOITActivatorMode mode;
}
-(id)initWithMode:(JUSTDOITActivatorMode)inMode;
@end

@implementation JUSTDOITListener

-(id)initWithMode:(JUSTDOITActivatorMode)inMode {
	if (self = [super init]) {
		mode = inMode;
	}
	return self;
}

-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[event setHandled:YES]
	
	switch (mode) {
		case kEnable:
			[[JUSTDOITController sharedInstance] setEnabled:YES];
			break;
	}
}

@end

void prefsChanged(){
	[JUSTDOITController sharedInstance].prefsChangedFromSettings = YES;
	[[JUSTDOITController sharedInstance] updateSettings];
}

void justdoitToggleOn(){
	[[JUSTDOITController sharedInstance] setEnabled:YES];
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)prefsChanged, CFSTR("com.redzrex.justdoit-prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)dimToggleOn, CFSTR("com.redzrex.justdoit-on"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	
	[JUSTDOITController sharedInstance];
	
	dlopen("/usr/lib/libactivator.dylib", RTLD_LAZY);
	Class la = objc_getClass("LAActivator");
	if (la) {
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		[[la sharedInstance] registerListener:[[JUSTDOITListener alloc] initWithMode:kEnable] forName:@"com.redzrex.justdoit-on"];
		[pool drain];
	}
}