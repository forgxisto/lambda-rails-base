// ライブラリの読み込み
import 'htmx.org';

() => import.meta.glob('../../view_components/**/*.js', { eager: true });
