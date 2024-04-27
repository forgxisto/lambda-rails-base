// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// application.css ファイルを最初に読み込む
import.meta.glob('../stylesheets/application.css', { eager: true });
// その他必要な css や js を読み込む

// ... ここに必要な css や js を読み込むコードを追加
import.meta.glob('../../view_components/atoms/**/*.css', { eager: true });
import.meta.glob('../../view_components/molecules/**/*.css', { eager: true });
import.meta.glob('../../view_components/organisms/**/*.css', { eager: true });
import.meta.glob('../../view_components/templates/**/*.css', { eager: true });
import.meta.glob('../../view_components/pages/**/*.css', { eager: true });

import 'htmx.org';

// 最後に view_components 配下の .js ファイルを全て読み込む
const componentFiles = import.meta.glob('../../view_components/**/*.js', { eager: true });
for (const path in componentFiles) {
  componentFiles[path];
}
