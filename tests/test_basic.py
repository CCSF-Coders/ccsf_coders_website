from selenium import webdriver

class TestMainPage:
  def setup(self):
    self.driver = webdriver.PhantomJS('phantomjs')
    self.driver.get('http://localhost:6969/templates/index.php')

  def test_SocialMediaLinksPresent(self):
    self.driver.find_element_by_id('social-github').is_displayed()
    self.driver.find_element_by_id('social-facebook').is_displayed()
    self.driver.find_element_by_id('social-youtube').is_displayed()
    self.driver.find_element_by_id('social-googlegroup').is_displayed()
    self.driver.find_element_by_id('social-twitter').is_displayed()
    return True

  def test_MeetingInfoIsPresent(self):
    self.driver.find_element_by_id('meetingtimes').is_displayed()
    self.driver.find_element_by_id('meetingrooms').is_displayed()
    return True

  def test_navBarLinksArePresent(self):
    self.driver.find_element_by_id('nav-home').is_displayed()
    self.driver.find_element_by_id('nav-events').is_displayed()
    self.driver.find_element_by_id('nav-contact').is_displayed()
    self.driver.find_element_by_id('nav-history').is_displayed()
    self.driver.find_element_by_id('nav-codingchallenges').is_displayed()
    return True

  def test_calendarIsPresent(self):
    self.driver.find_element_by_id('events-calendar').is_displayed()
    return True

  def test_contactsArePresent(self):
    self.driver.find_element_by_id('contacts-president').is_displayed()
    self.driver.find_element_by_id('contacts-advisor').is_displayed()
    self.driver.find_element_by_id('contacts-treasurer').is_displayed()
    self.driver.find_element_by_id('contacts-codersemail').is_displayed()
    return True

  def teardown(self):
    self.driver.close()