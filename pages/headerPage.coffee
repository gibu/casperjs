class HeaderPage
  constructor: (@test, @casper) ->

  showUrl: ()->
    @casper.then ()=>
      console.log @casper.getCurrentUrl()

  logout: ()->
    # console.log "logout"
    @casper.then ()->
      @click '.logged-in__logout'

module.exports = HeaderPage