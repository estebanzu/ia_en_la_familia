import sharp from 'sharp';
import { trace } from 'potrace';
import { writeFileSync, unlinkSync } from 'fs';
import { promisify } from 'util';

const inputPath = 'logo.jpg';
const outputPath = 'logo.svg';
const tempPath = 'temp-trace.png';

const traceAsync = promisify(trace);

async function convert() {
  try {
    // Preprocess: grayscale, threshold (no negate for white-on-transparent)
    await sharp(inputPath)
      .grayscale()
      .threshold(128)
      .toFormat('png')
      .toFile(tempPath);

    // Trace the PNG file
    const svg = await traceAsync(tempPath, {
      turdsize: 100,
      turnpolicy: 'minority',
      alphamax: 1,
      opticurve: true,
      opttolerance: 0.2
    });

    // Change fill from black to white
    const whiteSvg = svg.replace('fill="black"', 'fill="white"');

    writeFileSync(outputPath, whiteSvg);
    unlinkSync(tempPath);
    console.log(`Converted ${inputPath} -> ${outputPath}`);
  } catch (err) {
    console.error('Conversion failed:', err.message);
    process.exit(1);
  }
}

convert();