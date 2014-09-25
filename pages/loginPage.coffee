class LoginPage
  constructor: (@test, @casper) ->

  waitUntilLoaded: ->
    @casper.waitForUrl /#\/login$/

  open: ->
    console.log @casper.getCurrentUrl()
    # @casper.open("http://localhost:3000/").waitForUrl /#\/login/
    @casper.thenOpen "http://localhost:3000/#login"

  fillLoginData: (loginData) ->
    @casper.then () ->
      @fill '.login', loginData, true
      @echo "In Login Page"

  waitForLoaded: ()->
    @casper.waitForUrl /#\/login/, ()=>
      @test.assertUrlMatch /login/, "Should be login page"

module.exports = LoginPage