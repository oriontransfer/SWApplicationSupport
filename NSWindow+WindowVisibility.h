/* SWVisibilityController
	A NIB-instanced object for toggling the visibility of a window.
 */

#import <Cocoa/Cocoa.h>

@interface NSWindow (WindowVisibility)

- (IBAction)toggleWindowVisibility:(id)sender;

@end