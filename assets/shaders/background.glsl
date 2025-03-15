#version 320 es
precision highp float;

uniform float iTime;
uniform float iResolutionX;   // iResolution.x
uniform float iResolutionY;   // iResolution.y
uniform float iMouseX;        // Mouse X position
uniform float iMouseY;        // Mouse Y position
uniform float iMouseZ;        // Mouse Z position (usually 0 or 1 to indicate whether the mouse is clicked)

out vec4 fragColor;

void main() {
    float t = iTime + 5.;
    float z = 6.;

    const int n = 100; // Particle count

    vec3 startColor = vec3(0, 0.64, 0.2);
    vec3 endColor = vec3(0.06, 0.35, 0.85);

    float startRadius = 0.84;
    float endRadius = 1.6;

    float power = 0.51;
    float duration = 4.;

    vec2 s = vec2(iResolutionX, iResolutionY);
    vec2 v = z * (2.0 * FlutterFragCoord().xy - s) / s.y;

    // Mouse axis y => zoom
    if (iMouseZ > 0.0) {
        v *= iMouseY / s.y * 20.0;
    }

    // Mouse axis x => duration
    if (iMouseZ > 0.0) {
        duration = iMouseX / s.x * 10.0;
    }

    vec3 col = vec3(0.0);
    vec2 pm = v.yx * 2.8;

    float dMax = duration;
    float evo = (sin(iTime * 0.01 + 400.0) * 0.5 + 0.5) * 99.0 + 1.0;

    float mb = 0.0;
    float mbRadius = 0.0;
    float sum = 0.0;
    for (int i = 0; i < n; i++) {
        float d = fract(t * power + 48934.4238 * sin(float(i / int(evo)) * 692.7398));

        float tt = 0.0;
        float a = 6.28 * float(i) / float(n);
        float x = d * cos(a) * duration;
        float y = d * sin(a) * duration;

        float distRatio = d / dMax;
        mbRadius = mix(startRadius, endRadius, distRatio);

        vec2 p = v - vec2(x, y);
        mb = mbRadius / dot(p, p);

        sum += mb;
        col = mix(col, mix(startColor, endColor, distRatio), mb / sum);
    }

    sum /= float(n);
    col = normalize(col) * sum;
    sum = clamp(sum, 0.0, 0.4);

    vec3 tex = vec3(1.0);
    col *= smoothstep(tex, vec3(0.0), vec3(sum));

    fragColor.rgb = col;
}
