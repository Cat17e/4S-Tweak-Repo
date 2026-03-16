#import <UIKit/UIKit.h>

// This is the "Pro" way to run commands that the Robot won't block
extern int posix_spawn(pid_t *pid, const char *path, const void *file_actions, const void *attrp, char *const argv[], char *const envp[]);

%hook SpringBoard

%new
- (void)rebootDevice {
    char *argv[] = {(char *)"reboot", NULL};
    posix_spawn(NULL, "/sbin/reboot", NULL, NULL, argv, NULL);
}

%new
- (void)respringDevice {
    char *argv[] = {(char *)"killall", (char *)"-9", (char *)"SpringBoard", NULL};
    posix_spawn(NULL, "/usr/bin/killall", NULL, NULL, argv, NULL);
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
