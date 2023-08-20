#import <Foundation/Foundation.h>
#import "CCShortRootListController.h"
#import <Preferences/PSListController.h>
#import <spawn.h>
#import <rootless.h>
@implementation ccappsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (void)respring:(id)sender {
    pid_t pid;
    const char* args[] = {"killall", "SpringBoard", NULL};
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/killall"]) {
        posix_spawn(&pid, "usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    } else {
        posix_spawn(&pid, "/var/jb/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    }
}

@end
