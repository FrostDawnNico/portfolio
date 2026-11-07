/** Theme colors used by canvas and WebGL are six-digit hex values in theme.css. */
export function readThemeRgb(name: string): [number, number, number] {
  const value = getComputedStyle(document.documentElement).getPropertyValue(name).trim();
  if (!/^#[0-9a-f]{6}$/i.test(value)) {
    console.warn(`Invalid theme color ${name}: ${value}`);
    return [0, 0, 0];
  }
  return [1, 3, 5].map(index => parseInt(value.slice(index, index + 2), 16)) as [number, number, number];
}
