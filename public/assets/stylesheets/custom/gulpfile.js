'use strict';

var gulp = require('gulp')
    , sass = require('gulp-sass');

// task
gulp.task('sass', function () {
    return gulp.src('./scss/custom.scss') // path to your file
        .pipe(sass())
        .pipe(gulp.dest('css'));
});
