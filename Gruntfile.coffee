module.exports = (grunt) ->
  grunt.initConfig
    
    clean:
      compile: ['lib']

    coffee:
      compile:
        expand: true,
        cwd: 'src/'
        src: ['*.coffee', '**/*.coffee'],
        dest: 'lib/',
        ext: '.js'

    mochaTest:
      test:
        options:
          reporter: 'spec',
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']

    watch:
      test:
        options: spawn: false
        files: ['src/**/*.coffee', 'test/**/*.coffee']
        tasks: [ 'mochaTest' ]
      coffee:
        files: '**/*.coffee'
        tasks: ['coffee']


  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-mocha-test"

  grunt.registerTask "default", ["clean:compile", "coffee"]
