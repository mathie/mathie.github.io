module.exports = (grunt) ->
  grunt.initConfig
    less:
      options:
        paths: [ "bower_components/bootstrap/less" ]
      production:
        files:
          "assets/css/application.css": "_assets/css/application.less"
    uglify:
      production:
        files:
          "assets/js/application.js": [
            "bower_components/jquery/dist/jquery.js",
            "bower_components/bootstrap/js/collapse.js",
            "bower_components/bootstrap/js/scrollspy.js",
            "_assets/js/application.js"
          ]

  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-less')

  grunt.registerTask('default', [ 'build' ])
  grunt.registerTask('build', [ 'less', 'uglify' ])
