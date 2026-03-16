#import <UIKit/UIKit.h>

@interface NSTask : NSObject
- (void)setLaunchPath:(NSString *)path;
- (void)setArguments:(NSArray *)arguments;
- (void)launch;
@end

%hook SpringBoard

%new
- (void)rebootDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/sbin/reboot"];
    [t launch];
}

%new
- (void)respringDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:@[@"-9", @"SpringBoard"]];
    [t launch];
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
