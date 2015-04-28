//
// HJCountDownButton
// Version 1.0.0
// Created by Jeffery He(hejicode@gmail.com) on 15/4/28.
//

#import "HJCountDownButton.h"

// the default start time, 30s
#define kDefaultStartTime 30

// NSTimer step
#define kDefaultStepTime 1

// the default string "Get Verification Code Again"
#define kDefaultAgainTitle @"Get Verification Code Again"

// default left second title
#define kDefaultLeftSecondTitle @"left %ld seconds"

@interface HJCountDownButton ()

/*!
 @property
 @abstract NSTimer
 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HJCountDownButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addTarget:self action:@selector(countDownAction:) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - private method
- (void)countTimeSelector:(NSTimer *)timer {
    self.startTime--;
    if (self.startTime > 0) {
        NSString *title = [NSString stringWithFormat:self.leftSecondTitle, (long)self.startTime];
        [self setTitle:title forState:UIControlStateNormal];
    } else {
        [self setTitle:self.againTitle forState:UIControlStateNormal];
        self.enabled = YES;
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)countDownAction:(HJCountDownButton *)timeButton {
    if ([self.delegate respondsToSelector:@selector(countDownButtonDidClick:)]) {
        
        // init NSTimer
        if (!self.timer) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:kDefaultStepTime target:self
                                                        selector:@selector(countTimeSelector:)
                                                        userInfo:nil repeats:YES];
            if (!self.startTime) {
                self.startTime = kDefaultStartTime;
            }
        }

        // add run loop
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

        // Set button's states to disable
        timeButton.enabled = NO;
        [self.delegate countDownButtonDidClick:timeButton];
    }
}

#pragma mark - public method
- (void)openTimer {
    if (self.timer) {
        [self.timer setFireDate:[NSDate distantPast]];
    }
}

- (void)closeTimer {
    if (self.timer) {
        [self.timer setFireDate:[NSDate distantFuture]];
    }
}

#pragma mark - getter setter
- (NSString *)againTitle {
    if (!_againTitle) {
        _againTitle = kDefaultAgainTitle;
    }
    return _againTitle;
}

- (NSString *)leftSecondTitle {
    if (!_leftSecondTitle) {
        _leftSecondTitle = kDefaultLeftSecondTitle;
    }
    return _leftSecondTitle;
}

@end
