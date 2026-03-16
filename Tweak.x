#import <UIKit/UIKit.h>
#include <dlfcn.h>

%hook SpringBoard

%new
- (void)rebootDevice {
    int (*systemPtr)(const char *) = (int (*)(const char *))dlsym(RTLD_DEFAULT, "system");
    if (systemPtr) systemPtr("reboot");
}

%new
- (void)respringDevice {
    int (*systemPtr)(const char *) = (int (*)(const char *))dlsym(RTLD_DEFAULT, "system");
    if (systemPtr) systemPtr("killall -9 SpringBoard");
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
