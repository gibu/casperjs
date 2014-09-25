class BeaconsPage
  constructor: (@test, @casper) ->

  waitUntilLoaded: ->
    @casper.waitForUrl /#\/beacons$/
    @casper.waitUntilVisible '.beacon'

  assertLoggedAs: (username) ->
    @casper.then () =>
      loggedAs = @casper.fetchText "#logged"
      @test.assertEquals loggedAs, username

  assertBeaconName: (name) ->
    @casper.then ()=>
      @test.assertSelectorHasText '.container .beacon:nth-child(2) h3 a', name

  getFirstBeaconName: () ->
    @casper.then () =>
      beacon = @casper.evaluate () ->
        beacon = document.querySelectorAll('.beacon')[1]

      @beaconName = @casper.evaluate () ->
        beacon.querySelector('h3 a').innerHTML

  clickFirstBeaconSettings: () ->
    @casper.then () =>
      @casper.click '.container .beacon:nth-child(2) .buttons .beacons__btn'

  clickAccountSettings: () ->
    @casper.then () =>
      @casper.click '.nav--settings'

  showUrl: ()->
    @casper.then ()=>
      console.log @casper.getCurrentUrl()

  logout: ()->
    # console.log "logout"
    @casper.then ()->
      @click '.logged-in__logout'


module.exports = BeaconsPage