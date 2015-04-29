//
// HJCountDownButton
// Version 1.0.0
// Created by Jeffery He(hejicode@gmail.com) on 15/4/28.
//

// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2015 Jeffery He(hejicode@gmail.com). All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@protocol HJCountDownButtonDelegate;

/*!
 @class
 @abstract Count Down Button
 */
@interface HJCountDownButton : UIButton

/*!
 @property
 @abstract start time
 */
@property (nonatomic, assign) NSInteger startTime;

/*!
 @property
 @abstract The string，example "Please try to get verification code again"
 */
@property (nonatomic, copy) NSString *againTitle;

/*!
 @property
 @abstract The string，example "Please try to get verification code again"
 */
@property (nonatomic, copy) NSString *leftSecondTitle;

/*!
 @property
 @abstract THCTimeButtonDelegate
 */
@property (nonatomic, weak) id<HJCountDownButtonDelegate> delegate;

/*!
 @method
 @abstract open NSTimer
 @discussion 
 */
- (void)openTimer;

/*!
 @method
 @abstract close NSTimer
 @discussion
 */
- (void)closeTimer;

@end

/*!
 @protocol
 @abstract HJCountDownButtonDelegate
 */
@protocol HJCountDownButtonDelegate <NSObject>

@required
- (void)countDownButtonDidClick:(HJCountDownButton *)timeButton;

@end
