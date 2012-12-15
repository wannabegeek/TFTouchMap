//
//  TFViewController.m
//  TFTouchMapView
//
//  Created by Tom Fewster on 14/12/2012.
//  Copyright (c) 2012 Tom Fewster. All rights reserved.
//

#import "TFViewController.h"
#import "TFTouchMapView.h"

@interface TFViewController () {
	UIPanGestureRecognizer *panGesture;
	UITapGestureRecognizer *tapGesture;
}
@property (weak) IBOutlet TFTouchMapView *touchMapView;
@property (weak) IBOutlet UILabel *actionText;
@end

@implementation TFViewController

@synthesize touchMapView = _touchMapView;
@synthesize actionText = _actionText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
	[_touchMapView addGestureRecognizer:panGesture];

	tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
	[_touchMapView addGestureRecognizer:tapGesture];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panning:(id)sender {
	_actionText.alpha = 1.0;
	_actionText.text = @"Panning";
	[UIView animateWithDuration:0.3 delay:0.5 options:kNilOptions animations:^{
		_actionText.alpha = 0.0;
	} completion:nil];
}

- (void)tap:(id)sender {
	_actionText.alpha = 1.0;
	_actionText.text = @"Tap";
	[UIView animateWithDuration:0.3 delay:0.5 options:kNilOptions animations:^{
		_actionText.alpha = 0.0;
	} completion:nil];
}

- (IBAction)enable:(UISwitch *)sender {
	if (sender.on) {
		tapGesture.enabled = YES;
		panGesture.enabled = YES;
	} else {
		tapGesture.enabled = NO;
		panGesture.enabled = NO;
	}
}

@end
