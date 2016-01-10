/***********************************************/
/*Only edit this if you know what you are doing*/
/***********************************************/

uniform vec2 resolution;
uniform float time;

void main(void) {
    vec2 position = gl_FragCoord.xy/resolution;
    float gradient = position.y;
    gl_FragColor = vec4(49.0/255.0,
                        1.0-position.y*1.4*(192.0/255.0)+(0.5*(position.y)*cos(time/50.0)),
                        190.0/255.0, 0.5);
}
