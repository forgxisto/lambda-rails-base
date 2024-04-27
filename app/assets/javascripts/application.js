// ライブラリの読み込み
import 'htmx.org';

// 最後に view_components 配下の .js ファイルを全て読み込む
const componentFiles = import.meta.glob('../../view_components/**/*.js', { eager: true });
for (const path in componentFiles) {
  componentFiles[path];
}

// これどうにかする
// import.meta.glob('../../view_components/atoms/**/*.css', { eager: true });
// import.meta.glob('../../view_components/molecules/**/*.css', { eager: true });
// import.meta.glob('../../view_components/organisms/**/*.css', { eager: true });
// import.meta.glob('../../view_components/templates/**/*.css', { eager: true });
// import.meta.glob('../../view_components/pages/**/*.css', { eager: true });
