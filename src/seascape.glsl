// Procedural wave field written for this portfolio.
precision highp float;
uniform vec2 iResolution;
uniform float iGlobalTime;
uniform float uWaveHeight;
uniform float uWaveChoppy;
uniform float uWaveFrequency;
uniform float uWavePhase;
uniform float uCameraHeight;

float waveField(vec2 p) {
  float f = uWaveFrequency;
  float phase = uWavePhase;
  float a = sin(dot(p, vec2(0.87, 0.49)) * f * 2.3 + phase * 1.15);
  float b = sin(dot(p, vec2(-0.43, 0.90)) * f * 3.7 - phase * 0.85);
  float c = sin(dot(p, vec2(0.98, -0.20)) * f * 7.1 + phase * 1.65);
  float d = sin(dot(p, vec2(0.30, 0.95)) * f * 11.0 - phase * 1.2);
  float blend = (a * 0.48 + b * 0.29 + c * 0.15 + d * 0.08);
  float crest = sign(blend) * pow(abs(blend), mix(1.0, 0.48, (uWaveChoppy - 1.0) / 5.0));
  return uWaveHeight * (0.85 + 0.70 * crest);
}

vec3 skyColor(vec3 direction) {
  float elevation = clamp(direction.y * 1.6, 0.0, 1.0);
  return mix(vec3(0.84, 0.92, 0.94), vec3(0.35, 0.64, 0.80), pow(elevation, 0.6));
}

void main() {
  vec2 uv = (gl_FragCoord.xy * 2.0 - iResolution) / iResolution.y;
  vec3 origin = vec3(0.0, uCameraHeight, iGlobalTime * 0.12);
  vec3 ray = normalize(vec3(uv.x * 0.90, uv.y - 0.16, -1.5));
  vec3 color = skyColor(ray);
  float previous = 0.0;
  float distanceAlongRay = 0.25;
  bool hit = false;
  for (int i = 0; i < 64; i++) {
    vec3 samplePoint = origin + ray * distanceAlongRay;
    if (samplePoint.y < waveField(samplePoint.xz)) { hit = true; break; }
    previous = distanceAlongRay;
    distanceAlongRay += max(0.32, distanceAlongRay * 0.09);
    if (distanceAlongRay > 220.0) break;
  }
  if (hit) {
    for (int i = 0; i < 6; i++) {
      float mid = (previous + distanceAlongRay) * 0.5;
      vec3 samplePoint = origin + ray * mid;
      if (samplePoint.y < waveField(samplePoint.xz)) distanceAlongRay = mid; else previous = mid;
    }
    vec3 point = origin + ray * distanceAlongRay;
    float eps = 0.08 + distanceAlongRay * 0.0005;
    float center = waveField(point.xz);
    float dx = (waveField(point.xz + vec2(eps, 0.0)) - center) / eps;
    float dz = (waveField(point.xz + vec2(0.0, eps)) - center) / eps;
    vec3 normal = normalize(vec3(-dx, 1.0, -dz));
    vec3 reflected = reflect(ray, normal);
    float fresnel = pow(1.0 - max(dot(-ray, normal), 0.0), 3.0);
    vec3 sun = normalize(vec3(-0.35, 0.80, -0.48));
    float spec = pow(max(dot(reflected, sun), 0.0), 80.0);
    float glimmer = pow(max(dot(reflected, sun), 0.0), 18.0);
    vec3 deep = mix(vec3(0.025, 0.16, 0.21), vec3(0.08, 0.30, 0.32), max(normal.y, 0.0));
    vec3 ocean = mix(deep, skyColor(reflected), 0.25 + 0.65 * fresnel) + vec3(1.0, 0.91, 0.76) * (spec * 0.75 + glimmer * 0.10);
    float haze = 1.0 - exp(-distanceAlongRay * 0.009);
    color = mix(ocean, skyColor(ray), clamp(haze, 0.0, 0.85));
  }
  gl_FragColor = vec4(pow(max(color, 0.0), vec3(0.9)), 1.0);
}
