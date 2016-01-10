//
//  AZBackgroundView.m
//  AZOpenGLTests
//
//  Created by callum taylor on 04/01/2016.
//  Copyright © 2016 razzile. All rights reserved.
//

#import "AZBackgroundView.h"
#import "Shader.h"

@interface AZBackgroundView ()

@property (nonatomic) Shader *shader;
@property (nonatomic) NSTimer *renderTimer;

@end

@implementation AZBackgroundView
@synthesize shader, renderTimer;

CFTimeInterval lastTime;

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        lastTime = CACurrentMediaTime();
    }
    return self;
}

- (void)awakeFromNib {
    renderTimer = [NSTimer timerWithTimeInterval:1.0/30.0   //30fps time interval
                                          target:self
                                        selector:@selector(timerFired:)
                                        userInfo:nil
                                         repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:renderTimer
                                 forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] addTimer:renderTimer
                                 forMode:NSEventTrackingRunLoopMode];
}

- (void)timerFired:(id)sender {
    [self setNeedsDisplay:YES];
}

static GLfloat const ShaderQuad[8] = {
    -1, -1,
    -1,  1,
     1, -1,
     1,  1
};


- (void)drawRect:(NSRect)dirtyRect {
    static Shader *s;
    if (!s) {
        self.window.titleVisibility = NSWindowTitleHidden;
        self.window.titlebarAppearsTransparent = YES;
        self.window.styleMask |= NSFullSizeContentViewWindowMask;
        s = [[Shader new] initWithShadersInAppBundle:@"Shader"];
        [s addAttribute:@"position"];
    }
    glUseProgramObjectARB([s programObject]);

    GLuint addr = [s getUniformLocation:"time"];
    glUniform1f(addr, CACurrentMediaTime());
    
    GLuint attribAddr = [s getAttribLocation:"position"];
    glEnableVertexAttribArray(attribAddr);
    glVertexAttribPointerARB(attribAddr, 2, GL_FLOAT, GL_FALSE, 0, ShaderQuad);
    
    GLuint res = [s getUniformLocation:"resolution"];
    glUniform2f(res, CGRectGetWidth(dirtyRect)*1.f, CGRectGetHeight(dirtyRect)*1.f);
    
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    glFlush();

    glUseProgramObjectARB(0);
}

@end
