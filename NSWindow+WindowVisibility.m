#import "NSWindow+WindowVisibility.h"

@implementation NSWindow (VisibilityController)

- (IBAction)toggleWindowVisibility:(id)sender
{
	if ([self isVisible]) {
		[self performClose:self];
	} else {
		[self makeKeyAndOrderFront:self];
	}
}

@end
