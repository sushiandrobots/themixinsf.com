var gulp = require('gulp')
  , sass = require('gulp-sass')
  , connect = require('gulp-connect');

gulp.task('sass', function () {
  gulp.src('sass/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('css'));
});

gulp.task('jekyll', function () {
  var jekyll = require('child_process').spawn('jekyll', ['build']);
  jekyll.on('close', function () {
    gulp.src('_site/**/*')
      .pipe(connect.reload());
  });
});

gulp.task('connect', connect.server({
  root: ['_site'],
  livereload: true
}));

gulp.task('watch', function () {
  gulp.watch('sass/*.scss', ['sass']);
  gulp.watch([
    '_config.yml',
    'css/*.css',
    '_posts/*.md',
    '_includes/*.html',
    '_layouts/*.html'
  ], ['jekyll']);
});

gulp.task('default', ['jekyll', 'connect', 'watch'])
