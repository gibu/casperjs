require = patchRequire(global.require)
BeaconsPage = require '../../pages/beaconsPage'
LoginPage = require '../../pages/loginPage'
HeaderPage = require '../../pages/headerPage'

casper.test.begin 'Logout', 0, (test) ->
  loginPage = new LoginPage(test, casper)
  # beaconsPage = new BeaconsPage(test, casper)
  headerPage = new HeaderPage(test, casper)
  casper.start()
  # beaconsPage.logout()
  headerPage.logout()
  loginPage.waitForLoaded()
  casper.run () ->
    test.done()