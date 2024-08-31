import * as esbuild from 'esbuild'
import ImportGlobPlugin from 'esbuild-plugin-import-glob';

const mapMode = process.env.RAILS_ENV === 'production' ? 'linked' : 'inline';

const config = {
  entryPoints: ['app/assets/javascripts/*.*'],
  bundle: true,
  sourcemap: mapMode,
  minify: true,
  format: 'esm',
  outdir: 'app/assets/builds',
  publicPath: '/assets',
  plugins: [
    ImportGlobPlugin.default(),
  ],
};

const watchMode = process.argv.includes('--watch');

if (watchMode) {
  const context = await esbuild.context(config)
  await context.watch();
  console.log('Watching...');
} else {
  await esbuild.build(config);
  console.log('Build complete!');
}