
# casper = require('casper')

# casper.test.begin 'Change beacon name', 2,  (test) ->
#   loginData =
#     username: 'ksi.marcin@gmail.com'
#     password: 'test'

#   casper.start()
#   casper.thenOpen("http://localhost:3000").waitForUrl /#\/login/, () ->
#     @fill '.login', loginData, true

#   casper.waitForUrl /#\/beacons/, ()->
#     loggedAs = @fetchText "#logged"
#     test.assertEquals(loggedAs, loginData.username)

#   #click first element

#   casper.then ()->
#     beacon = @evaluate ()->
#       beacon = document.querySelectorAll('.beacon')[1]
#       {
#         name: 'document.querySelectorAll'
#       }
#     # @echo beacons.length
#     # beacon = beacons[1]
#     # beaconName = @evaluate ()->
#     #   beacon.querySelector('h3 a')
#     # @echo beaconName
#     @echo beacon
  # logout
  # casper.then ()->
  #   @click '.logged-in__logout'

  # casper.waitForUrl /#\/login/, () ->
  #   @echo "logout"
  #   test.assertUrlMatch /login/, "Should be login page"

  # casper.run ()->
  #   test.done()

# casper.test.begin 'Good login', 2,  (test) ->
#   loginData =
#     username: 'ksi.marcin@gmail.com'
#     password: 'test'

#   casper.start()
#   casper.thenOpen("http://localhost:3000").waitForUrl /#\/login/, () ->
#     @fill '.login', loginData, true

#   casper.waitForUrl /#\/beacons/, ()->
#     loggedAs = @fetchText "#logged"
#     test.assertEquals(loggedAs, loginData.username)

#   # logout
#   casper.then ()->
#     @click '.logged-in__logout'

#   casper.waitForUrl /#\/login/, () ->
#     @echo "logout"
#     test.assertUrlMatch /login/, "Should be login page"

#   casper.run ()->
#     test.done()


# casper.test.begin 'Fake login', 1,  (test) ->
#   loginData =
#     username: 'ksi.marcin@gmail.com'
#     password: 'test22'

#   casper.start()
#   casper.thenOpen("http://localhost:3000").waitForUrl /#\/login/, () ->
#     @fill '.login', loginData, true
#     @echo "in loging page"

#   casper.waitForSelectorTextChange '.error', ()->
#     # @echo "new error text"
#     error = @evaluate ()->
#       document.querySelector('.error').innerHTML
#     # @echo error
#     test.assertEquals(error, "Incorrect email or password")
#     # loggedAs = @fetchText "#logged"
#     # test.assertEquals(loggedAs, loginData.username)

#   casper.run ()->
#     test.done()