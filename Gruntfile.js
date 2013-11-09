module.exports = function(grunt) {

  // Show elapsed time at the end
  require('time-grunt')(grunt);

  // Load all grunt tasks
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
      
    sass: {
      dist: {
        options: {
          style: 'compressed'
        },
        files: [{
          expand: true,
          cwd: 'sass',
          src: '*.scss',
          dest: 'css',
          ext: '.css'
        }]
      }
    },

    watch: {
      sass: {
        files: ['sass/*.scss'],
        tasks: ['sass'],
        options: {
          livereload: true
        }
      },
      html: {
        files: ['*.html'],
        options: {
          livereload: true
        }
      }
    }

  });

  grunt.registerTask('default', ['watch']);

};