#import <UIKit/UIKit.h>

@interface NSTask : NSObject
- (void)setLaunchPath:(NSString *)path;
- (void)setArguments:(NSArray *)arguments;
- (void)launch;
@end

%hook SpringBoard

// Reboot
%new
- (void)rebootDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/sbin/reboot"];
    [t launch];
}

// Respring
%new
- (void)respringDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:@[@"-9", @"SpringBoard"]];
    [t launch];
}

// Shutdown
%new
- (void)shutdownDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/sbin/shutdown"];
    [t setArguments:@[@"-h", @"now"]];
    [t launch];
}

// Safe Mode
%new
- (void)safeModeDevice {
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:@[@"-9", @"SpringBoard"]];
    // Additional logic may be needed to trigger jailbreak safe mode
    [t launch];
}

// Kill all background apps
%new
- (void)killAllBackgroundTasks {
    // Placeholder: iterate SBApplicationController to terminate apps
}

// Low Power Mode (iOS 6 style)
%new
- (void)enableLowPowerMode {
    [[UIScreen mainScreen] setBrightness:0.2];
    // Placeholder: add other tweaks like background app termination
}

%end
