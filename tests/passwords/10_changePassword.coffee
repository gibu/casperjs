require = patchRequire(global.require)

BeaconsPage = require '../../pages/beaconsPage'
LoginPage = require '../../pages/loginPage'
BeaconSettingsPage = require '../../pages/beaconSettingsPage'
AccountSettingsPage = require '../../pages/accountSettingsPage'
HeaderPage = require '../../pages/headerPage'

casper.test.begin 'Change password', 2, (test) ->
  password = 'test'
  new_password = 'test22'
  loginData =
    username: 'ksi.marcin@gmail.com'
    password: 'test'
  casper.start()
  loginPage = new LoginPage(test, casper)
  accountSettingsPage = new AccountSettingsPage(test, casper)
  beaconsPage = new BeaconsPage(test, casper)
  headerPage = new HeaderPage(test, casper)

  beaconsPage.waitUntilLoaded()
  console.log beaconsPage.showUrl()
  beaconsPage.clickAccountSettings()
  accountSettingsPage.waitUntilLoaded()
  console.log accountSettingsPage.showUrl()
  accountSettingsPage.setPassword(new_password)
  accountSettingsPage.setName("sweet cow")
  accountSettingsPage.getPassword()
  accountSettingsPage.getName()
  accountSettingsPage.saveChanges()
  accountSettingsPage.waitForMessageBox()
  accountSettingsPage.assertInformationShouldBeVisible()
  headerPage.logout()
  # loginPage.waitUntilLoaded()
  # loginData.password = new_password
  # loginPage.fillLoginData(loginData)
  # beaconsPage.waitUntilLoaded()
  # console.log beaconsPage.showUrl()
  # beaconsPage.clickAccountSettings()
  # accountSettingsPage.waitUntilLoaded()
  # accountSettingsPage.setPassword(password)
  # accountSettingsPage.saveChanges()
  # accountSettingsPage.waitForMessageBox()
  # accountSettingsPage.assertInformationShouldBeVisible()
  casper.run ()->
    test.done()