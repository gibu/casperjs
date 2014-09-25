class BeaconSettingsPage
  constructor: (@test, @casper) ->

  # waitUntilLoaded: ->
  #   @casper.waitForUrl /settings/

  waitUntilLoaded: ->
    @casper.waitUntilVisible "#mac span"

  setBeaconName: (name) ->
    @casper.then () =>
      @casper.sendKeys("#name input", name, reset: true)

  getBeaconName: () ->
    @casper.then () =>
      @casper.evaluate () ->
        document.querySelector("#name input").value

  saveChanges: () ->
    @casper.then () =>
      @casper.click '.btn--primary'

  showUrl: ()->
    @casper.then ()=>
      console.log @casper.getCurrentUrl()

module.exports = BeaconSettingsPage