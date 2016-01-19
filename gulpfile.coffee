gulp             = require 'gulp'
plumber          = require 'gulp-plumber'
sass             = require 'gulp-sass'
sourcemaps       = require 'gulp-sourcemaps'
pleeease         = require 'gulp-pleeease'
browserSync      = require 'browser-sync'


#
# SCSS (with AutoPrefixer, minify, SourceMaps)
#
gulp.task 'styles', ->
  gulp.src './src/styles/*.scss'
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe sass().on 'error', sass.logError
    .pipe pleeease()
    .pipe sourcemaps.write '.'
    .pipe gulp.dest './assets/css/'


#
# build assets (css, javascript)
#
gulp.task 'build', ['styles']


#
# Watch
#
gulp.task 'watch', ->
  gulp.watch 'src/styles/**/!(._)*.scss', ['styles']


#
# start BrowserSync / LiveReload
#
gulp.task 'serve', ['watch'], ->
  browserSync
    notify: false,
    port: 9000,
    server:
      baseDir: '.'

  gulp.watch [
    '**/!(._)*.html'
    '**/!(._)*.php'
    'assets/!(._)**/*.js'
    'assets/!(._)**/*.css'
  ]
  .on 'change', browserSync.reload


gulp.task 'default', ['build', 'serve']
