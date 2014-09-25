require = patchRequire(global.require)
# BeaconsPage = require '../pages/beaconsPage'
LoginPage = require '../../pages/loginPage'
# BeaconSettingsPage = require '../pages/BeaconSettingsPage'

casper.test.begin 'Log into account', 0, (test) ->
  loginData =
    username: 'ksi.marcin@gmail.com'
    password: 'test'
  newBeaconName = 'sweet cow'

  casper.start('http://localhost:3000/')
  loginPage = new LoginPage(test, casper)

  loginPage.open()
  loginPage.fillLoginData(loginData)
  casper.run ()->
    test.done()