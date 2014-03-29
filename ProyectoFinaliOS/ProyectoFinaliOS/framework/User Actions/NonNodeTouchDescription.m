#import "NonNodeTouchDescription.h"
#import "NonNodeTouch.h"

@implementation NonNodeTouchDescription

- initWithAllowed:(BOOL)allowed;
{
	self = [super initWithKind:[NonNodeTouch class]];
	self.allowed = allowed;
	return self;
}

- (BOOL)mathesAction:(UserAction *)action
{
	return [super mathesAction:action] && self.allowed;
}

@end
