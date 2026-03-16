#import <UIKit/UIKit.h>

// Using a direct declaration to avoid "Missing Header" errors
extern "C" int posix_spawn(int *, const char *, const void *, const void *, char *const [], char *const []);

%hook SpringBoard

%new
- (void)rebootDevice {
    char *args[] = {(char *)"reboot", NULL};
    posix_spawn(NULL, "/sbin/reboot", NULL, NULL, args, NULL);
}

%new
- (void)respringDevice {
    char *args[] = {(char *)"killall", (char *)"-9", (char *)"SpringBoard", NULL};
    posix_spawn(NULL, "/usr/bin/killall", NULL, NULL, args, NULL);
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
