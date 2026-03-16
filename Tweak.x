#import <UIKit/UIKit.h>

extern "C" int system(const char *command);

%hook SpringBoard

%new
- (void)rebootDevice {
    system("reboot");
}

%new
- (void)respringDevice {
    system("killall -9 SpringBoard");
}

%end

%hook SBStatusBarDataManager
- (void)_updateBatteryPercentItem {
    %orig;
}
%end
