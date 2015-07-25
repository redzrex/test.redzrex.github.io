#import <Preferences/Preferences.h>

@interface JUSTDOITListController: PSListController {
}
@end

@implementation JUSTDOITListController

-(void)RXTwitterButtonTapped
{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/redzrex"];
    if ([app canOpenURL:tweetbot])
        [app openURL:tweetbot];
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=redzrex"];
        if ([app canOpenURL:twitterapp])
            [app openURL:twitterapp];
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/redzrex"];
            [app openURL:twitterweb];
        }
    }
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"JUSTDOIT" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
