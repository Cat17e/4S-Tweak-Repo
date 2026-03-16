#import <UIKit/UIKit.h>
#include <spawn.h>

extern char **environ;

%hook SpringBoard

%new
- (void)rebootDevice {
    pid_t pid;
    const char *args[] = {"reboot", NULL};
    posix_spawn(&pid, "/sbin/reboot", NULL, NULL, (char* const*)args, environ);
}

%new
- (void)respringDevice {
    pid_t pid;
    const char *args[] = {"killall", "-9", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, environ);
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
