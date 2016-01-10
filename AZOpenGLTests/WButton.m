//
//  WButton.m
//  AZOpenGLTests
//
//  Created by callum taylor on 09/01/2016.
//  Copyright © 2016 razzile. All rights reserved.
//

#import "WButton.h"
#import "WButtonCell.h"

@implementation WButton

- (id)init {
    if (self = [super init]) {
        [self setupControl];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setupControl];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self setupControl];
    }
    return self;
}


- (void)setupControl {
    //[self setCell:[WButtonCell new]];
}

//+ (Class)cellClass {
//    return [WButtonCell class];
//}

- (void)drawRect:(NSRect)dirtyRect {
  //[super drawRect:dirtyRect];
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    
    NSColor *colorToFill, *textColor;
    if(self->isHighlighted)
    {
        colorToFill = [NSColor colorWithRed:1 green:1 blue:1 alpha:1];
        textColor = [NSColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    else
    {
        colorToFill = [NSColor colorWithRed:0 green:0 blue:0 alpha:0];
        textColor = [NSColor colorWithRed:1 green:1 blue:1 alpha:1];
    }
    CGContextSetFillColorWithColor(ctx, colorToFill.CGColor);
    CGContextFillRect(ctx, dirtyRect);
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = dirtyRect;
    textLayer.foregroundColor = textColor.CGColor;
    textLayer.string = self.title;
    textLayer.font = (__bridge CFTypeRef)[NSFont systemFontOfSize:12];
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.wrapped = true;
    
    if(self->isHighlighted)
    {
        [textLayer drawInContext:ctx];
        //self.layer.mask = nil;
    }
    else
    {
        [textLayer drawInContext:ctx];
        //CAShapeLayer *maskLayer = [[CAShapeLayer alloc]initWithLayer:textLayer];
        //maskLayer.fillMode = kCAFillRuleEvenOdd;
        //self.layer.mask = maskLayer;
    }
        
    
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokeRect(ctx, dirtyRect);
//    
//    NSColor *textColor = self.offTextColor;
//    if ([self isHighlighted]) {
//        [self.backgroundColor setFill];
//        NSRectFillUsingOperation(dirtyRect, NSCompositeSourceAtop);
//        textColor = self.onTextColor;
//    }
//    NSDictionary *att = nil;
//    NSMutableParagraphStyle *style =
//    [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    [style setLineBreakMode:NSLineBreakByWordWrapping];
//    [style setAlignment:NSCenterTextAlignment];
//    att = [[NSDictionary alloc] initWithObjectsAndKeys:
//           style, NSParagraphStyleAttributeName,
//           textColor,
//           NSForegroundColorAttributeName, nil];
//    NSRect rect;
//    rect.size = [[self title] sizeWithAttributes:att];
//    rect.origin.x = floor( NSMidX([self bounds]) - rect.size.width / 2 );
//    rect.origin.y = floor( NSMidY([self bounds]) - rect.size.height / 2 );
//    [self.title drawInRect:rect withAttributes:att];
//
}

- (void)mouseEntered:(NSEvent *)event
{
    self->isHighlighted = true;
    //[[self cell]setBackgroundColor:[NSColor colorWithRed:1 green:1 blue:1 alpha:1]];
}

-(void)mouseExited:(NSEvent *)event
{
    self->isHighlighted = false;
    //[[self cell]setBackgroundColor:[NSColor colorWithRed:0 green:0 blue:0 alpha:1]];
}

@end
