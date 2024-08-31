console.log(process.env.RAILS_ENV);

module.exports = {
  map: { inline: process.env.RAILS_ENV !== 'production' },
  plugins: [
    require('postcss-import-ext-glob'),
    require('postcss-import'),
    require('postcss-nesting'),
    require('autoprefixer'),
    require('cssnano')({
      preset: 'default',
    }),
  ],
}