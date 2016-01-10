//
//  WButton.h
//  AZOpenGLTests
//
//  Created by callum taylor on 09/01/2016.
//  Copyright © 2016 razzile. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface WButton : NSButton
{
    BOOL isHighlighted;
}

@property (nonatomic) IBInspectable NSColor *onTextColor;
@property (nonatomic) IBInspectable NSColor *offTextColor;
@property (nonatomic) IBInspectable NSColor *borderColor;
@property (nonatomic) IBInspectable NSColor *backgroundColor;

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property () IBInspectable BOOL noBackground;

@end
