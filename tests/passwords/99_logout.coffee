require = patchRequire(global.require)
BeaconsPage = require '../../pages/beaconsPage'
LoginPage = require '../../pages/loginPage'

casper.test.begin 'Logout', 0, (test) ->
  loginPage = new LoginPage(test, casper)
  beaconsPage = new BeaconsPage(test, casper)
  casper.start()
  beaconsPage.logout()
  loginPage.waitForLoaded()
  casper.run () ->
    test.done()