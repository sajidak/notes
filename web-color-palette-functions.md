# Identify color brightness - percieved

- `Brightness (Luminance) = 0.2126 * R + 0.7152 * G + 0.0722 * B`
- A common threshold is 128 on the 0–255 scale:
  - If luminance ≥ 128, consider the color bright
  - If luminance < 128, consider it dark

***
## Code
### javascript
```js
/**
 * Calculates the perceived brightness of a color and determines if it is considered bright.
 * Supports RGB (0–255), hex strings (e.g. "#RRGGBB" or "#RRGGBBAA"), and optional alpha transparency.
 * Alpha transparency is composited over a white background (or black, if toggled).
 *
 * @param {number|string} inputR - Red component (0–255) or full hex string starting with "#".
 * @param {number|string} [inputG] - Green component (0–255) if not using hex string.
 * @param {number|string} [inputB] - Blue component (0–255) if not using hex string.
 * @param {number|string} [inputA=255] - Alpha component (0–255), optional.
 * @returns {{ brightness: number, isBright: boolean }} Object with brightness level (0–255) and brightness classification.
 *
 * @example
 * getBrightnessInfo("#64C832");        // { brightness: 167.9, isBright: true }
 * getBrightnessInfo(10, 10, 10);       // { brightness: 10.0, isBright: false }
 * getBrightnessInfo("#0A0A0A80");      // { brightness: 204.2, isBright: true }
 * getBrightnessInfo("64", "C8", "32"); // { brightness: 167.9, isBright: true }
 */
function getBrightnessInfo(inputR, inputG, inputB, inputA = 255) {
  // Handle hex color string like "#RRGGBB" or "#RRGGBBAA"
  if (typeof inputR === 'string' && inputR.startsWith('#')) {
    const hex = inputR.slice(1);
    if (![6, 8].includes(hex.length)) throw new Error("Invalid hex color");

    inputR = parseInt(hex.slice(0, 2), 16);
    inputG = parseInt(hex.slice(2, 4), 16);
    inputB = parseInt(hex.slice(4, 6), 16);
    inputA = hex.length === 8 ? parseInt(hex.slice(6, 8), 16) : 255;
  }

  // Convert hex strings to numbers
  const parse = v => (typeof v === 'string' ? parseInt(v, 16) : v);
  const r = parse(inputR);
  const g = parse(inputG);
  const b = parse(inputB);
  const a = parse(inputA);

  const alphaRatio = a / 255;

  // Background color to blend over (white by default)
  const bg = { r: 255, g: 255, b: 255 }; // white
  // const bg = { r: 0, g: 0, b: 0 };    // black ← uncomment to use black background

  // Alpha blending
  const blend = (fg, bg, alpha) => Math.round((1 - alpha) * bg + alpha * fg);
  const rBlended = blend(r, bg.r, alphaRatio);
  const gBlended = blend(g, bg.g, alphaRatio);
  const bBlended = blend(b, bg.b, alphaRatio);

  // Perceived brightness (luminance)
  const brightness = 0.2126 * rBlended + 0.7152 * gBlended + 0.0722 * bBlended;

  return {
    brightness: brightness,
    isBright: brightness >= 128
  };
}
```

### Typescript
```ts
***
/**
 * Calculates the perceived brightness of a color and determines if it is considered bright.
 * Supports RGB (0–255), hex strings (e.g. "#RRGGBB" or "#RRGGBBAA"), and optional alpha transparency.
 * Alpha transparency is composited over a white background (or black, if toggled).
 *
 * @param {number | string} inputR - Red component (0–255) or a full hex string starting with "#".
 * @param {number | string} [inputG] - Green component (0–255) if not using hex string.
 * @param {number | string} [inputB] - Blue component (0–255) if not using hex string.
 * @param {number | string} [inputA=255] - Alpha component (0–255), optional.
 * @returns {{ brightness: number, isBright: boolean }} Object with brightness level (0–255) and brightness classification.
 *
 * @example
 * getBrightnessInfo("#64C832");        // { brightness: 167.9, isBright: true }
 * getBrightnessInfo(10, 10, 10);       // { brightness: 10.0, isBright: false }
 * getBrightnessInfo("#0A0A0A80");      // { brightness: 204.2, isBright: true }
 * getBrightnessInfo("64", "C8", "32"); // { brightness: 167.9, isBright: true }
 */
function getBrightnessInfo(
  inputR: number | string,
  inputG?: number | string,
  inputB?: number | string,
  inputA: number | string = 255
): { brightness: number; isBright: boolean } {
  // Handle hex string input like "#RRGGBB" or "#RRGGBBAA"
  if (typeof inputR === 'string' && inputR.startsWith('#')) {
    const hex = inputR.slice(1);
    if (![6, 8].includes(hex.length)) throw new Error("Invalid hex color");

    inputR = parseInt(hex.slice(0, 2), 16);
    inputG = parseInt(hex.slice(2, 4), 16);
    inputB = parseInt(hex.slice(4, 6), 16);
    inputA = hex.length === 8 ? parseInt(hex.slice(6, 8), 16) : 255;
  }

  // Utility to parse hex strings or pass numbers through
  const parse = (v: number | string): number =>
    typeof v === 'string' ? parseInt(v, 16) : v;

  const r = parse(inputR);
  const g = parse(inputG ?? 0);
  const b = parse(inputB ?? 0);
  const a = parse(inputA);

  const alphaRatio = a / 255;

  // Background color to blend over (white by default)
  const bg = { r: 255, g: 255, b: 255 }; // white
  // const bg = { r: 0, g: 0, b: 0 };    // black ← uncomment to blend over black

  // Alpha blending
  const blend = (fg: number, bg: number, alpha: number): number =>
    Math.round((1 - alpha) * bg + alpha * fg);

  const rBlended = blend(r, bg.r, alphaRatio);
  const gBlended = blend(g, bg.g, alphaRatio);
  const bBlended = blend(b, bg.b, alphaRatio);

  // Perceived brightness (luminance)
  const brightness = 0.2126 * rBlended + 0.7152 * gBlended + 0.0722 * bBlended;

  return {
    brightness,
    isBright: brightness >= 128
  };
}
```
***

