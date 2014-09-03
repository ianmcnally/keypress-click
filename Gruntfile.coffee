module.exports = (grunt) ->

  grunt.initConfig

    coffee :
      compile :
        files :
          'dist/keypress_click.js' : ['src/keypress_click.coffee']

    coffeelint :
      app : ['src/**/*.coffee']
      options : grunt.file.readJSON 'config/coffeelint.json'

    watch :
      coffee :
        files : ['src/keypress_click.coffee']
        tasks : ['compile']

  grunt.registerTask 'compile', ['coffeelint', 'coffee']
  grunt.registerTask 'dev', ['watch']

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'