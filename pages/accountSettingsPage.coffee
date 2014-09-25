class AccountSettingsPage
  constructor: (@test, @casper) ->

  waitUntilLoaded: ->
    @casper.waitForUrl /account/
    # @casper.waitUntilVisible '.user input[name="user"]'
    @casper.waitForResource /current$/

  setPassword: (password) ->
    @casper.then () =>
      console.log "set password"
      @casper.sendKeys('.user input[name="password"]', password, reset: false)

  getPassword: () ->
    @casper.then () =>
      console.log "get password"
      password = @casper.evaluate () ->
        document.querySelector('.user input[name="password"]').value
      console.log password
      password

  setName: (user) ->
    @casper.then () =>
      console.log "set name"
      @casper.sendKeys('.user input[name="user"]', user, reset: false)

  getName: () ->
    @casper.then () =>
      console.log "get name"
      name = @casper.evaluate () ->
        document.querySelector('.user input[name="user"]').value
      console.log name
      name

  assertInformationShouldBeVisible: () ->
    @casper.then ()=>
      @test.assertVisible('.message')

  saveChanges: () ->
    @getName()
    @getPassword()
    @casper.then () =>
      console.log "save changes"
      @casper.click '.btn--primary'

  waitForMessageBox: () ->
    @casper.waitForResource /v1\/users$/, ()=>
      console.log "in wait for message box"
      console.log @casper.fetchText '.message'

  showUrl: ()->
    @casper.then ()=>
      console.log @casper.getCurrentUrl()

  logout: ()->
    @casper.then ()->
      @click '.logged-in__logout'

module.exports = AccountSettingsPage