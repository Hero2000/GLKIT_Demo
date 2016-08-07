//
//  PickTerrainShader.vsh
//  
//

/////////////////////////////////////////////////////////////////
// VERTEX ATTRIBUTES
/////////////////////////////////////////////////////////////////
attribute vec3 a_position;
attribute vec2 a_texCoords0;

/////////////////////////////////////////////////////////////////
// TEXTURE
/////////////////////////////////////////////////////////////////
#define MAX_TEXTURES    1
#define MAX_TEX_COORDS  1

/////////////////////////////////////////////////////////////////
// UNIFORMS
/////////////////////////////////////////////////////////////////
uniform mat4      u_mvpMatrix;
uniform vec2      u_dimensionFactors;
uniform float     u_modelIndex;
uniform sampler2D u_units[MAX_TEXTURES];

/////////////////////////////////////////////////////////////////
// Varyings
/////////////////////////////////////////////////////////////////
varying vec4      v_color;
varying vec2      v_texCoords[MAX_TEX_COORDS];


void main()
{
   float r = a_position.x * u_dimensionFactors.x;
   float g = a_position.z * u_dimensionFactors.y;
   
   v_color = vec4(r, g, u_modelIndex, 1.0);
   
   // Texture coords
   v_texCoords[0] = a_texCoords0;
   
   gl_Position = u_mvpMatrix * vec4(a_position, 1.0); 
}
