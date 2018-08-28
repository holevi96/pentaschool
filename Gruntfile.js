/**
 * Gruntfile for task automation.
 * Includes js minify and less compiling.
 * @author György Herbszt
 */
module.exports = function (grunt) {
    "use strict";
    require('jit-grunt');

    grunt.initConfig({
        less: {
            development: {
                options: {
                    compress: true,
                    yuicompress: true,
                    optimization: 2,
                    sourceMap: true,
                    sourceMapURL: 'penta.min.css.map',
                    sourceMapRootpath: '../../../../'
                },
                files: [
                    { 'wp-content/themes/penta/dist/penta.min.css': 'wp-content/themes/penta/less/penta.less' }

                ]
            }
        },
        watch: {
            styles: {
                files: ['wp-content/themes/penta/less/**/*.less'],
                tasks: ['less'],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['less', 'watch']);
};