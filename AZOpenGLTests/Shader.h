//
//  Copyright (c) 2008 Apple Inc., All rights reserved.
//
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
//
// Required Includes
//
//-------------------------------------------------------------------------

#import <Cocoa/Cocoa.h>
#import <OpenGL/OpenGL.h>

//-------------------------------------------------------------------------
//
// GLSL Shader
//
//-------------------------------------------------------------------------

@interface Shader : NSObject
{
@private
    const GLcharARB    *fragmentShaderSource;		// the GLSL source for the fragment Shader
    const GLcharARB    *vertexShaderSource;			// the GLSL source for the vertex Shader
    GLhandleARB		    programObject;				// the program object
} // Shader

- (id) initWithShadersInAppBundle:(NSString *)theShadersName;

- (GLhandleARB) programObject;

- (GLint) getUniformLocation:(const GLcharARB *)theUniformName;
- (GLint) getAttribLocation:(const GLcharARB *)theAttribName;
- (void)  addAttribute:(NSString *)attribute;


@end

//-------------------------------------------------------------------------

