#import <UIKit/UIKit.h>
#include <spawn.h>

extern char **environ;

// This fixes the 'exit code 2' by using a command the robot likes
void run_cmd(const char *cmd) {
    pid_t pid;
    const char *argv[] = {"sh", "-c", cmd, NULL};
    posix_spawn(&pid, "/bin/sh", NULL, NULL, (char* const*)argv, environ);
    waitpid(pid, NULL, 0);
}

%hook SpringBoard
%new
- (void)rebootDevice {
    run_cmd("reboot");
}
%new
- (void)respringDevice {
    run_cmd("killall -9 SpringBoard");
}
%new
- (void)enterSafeMode {
    run_cmd("touch /var/mobile/Library/Preferences/com.saurik.Safemode.flag && killall -9 SpringBoard");
}
%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
