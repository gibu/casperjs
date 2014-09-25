require = patchRequire(global.require)
BeaconsPage = require '../../pages/beaconsPage'
# LoginPage = require '../pages/loginPage'
BeaconSettingsPage = require '../../pages/beaconSettingsPage'
HeaderPage = require '../../pages/headerPage'

casper.test.begin 'Update beacons name', 1, (test) ->
  loginData =
    username: 'ksi.marcin@gmail.com'
    password: 'test'
  newBeaconName = 'sweet cow'

  casper.start()
  # loginPage = new LoginPage(test, casper)
  beaconsPage = new BeaconsPage(test, casper)
  beaconSettingsPage = new BeaconSettingsPage(test, casper)
  beaconsPage.waitUntilLoaded()
  beaconsPage.getFirstBeaconName()
  beaconsPage.clickFirstBeaconSettings()
  beaconSettingsPage.waitUntilLoaded()
  beaconSettingsPage.setBeaconName(newBeaconName)
  beaconSettingsPage.getBeaconName()
  beaconSettingsPage.saveChanges()
  beaconsPage.waitUntilLoaded()
  # beaconsPage.showUrl()
  beaconsPage.getFirstBeaconName()
  beaconsPage.assertBeaconName(newBeaconName)
  # beaconsPage.assertLoggedAs(loginData.username)
  casper.run () ->
    test.done()