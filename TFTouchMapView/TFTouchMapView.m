//
//  TFTouchMapView.m
//  TFTouchMapView
//
//  Created by Tom Fewster on 14/12/2012.
//  Copyright (c) 2012 Tom Fewster. All rights reserved.
//

//#define USING_AUTO_LAYOUT 1

#import "TFTouchMapView.h"

@interface TFTouchMapView ()
@property (strong) UIView *touchView;
@end


@implementation TFTouchMapView

@synthesize touchView = _touchView;

- (void)awakeFromNib {
	_touchView = [[UIView alloc] initWithFrame:CGRectZero];
#ifdef USING_AUTO_LAYOUT
	_touchView.translatesAutoresizingMaskIntoConstraints = NO;
#else
	_touchView.frame = self.frame;
#endif
	[self addSubview:_touchView];

#ifdef USING_AUTO_LAYOUT
	NSDictionary *views = NSDictionaryOfVariableBindings(_touchView);
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_touchView]|" options:kNilOptions metrics:nil views:views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_touchView]|" options:kNilOptions metrics:nil views:views]];
#endif

	[self bringSubviewToFront:_touchView];

	for (UIView *view in self.subviews) {
		if (view != _touchView) {
			for (UIGestureRecognizer *gesture in view.gestureRecognizers) {
				NSLog(@"Found: %@", gesture);
				[_touchView addGestureRecognizer:gesture];
			}
		}
	}
}

- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
	[_touchView addGestureRecognizer:gestureRecognizer];
}

- (void)removeGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
	[_touchView removeGestureRecognizer:gestureRecognizer];
}

- (NSArray *)gestureRecognizers {
	return _touchView.gestureRecognizers;
}

@end
