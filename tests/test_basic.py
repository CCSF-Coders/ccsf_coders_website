from selenium import webdriver

class TestMainPage:
  def setup(self):
    self.driver = webdriver.Firefox()
    # localhost 6969 for local, default Vagrant environment development.
    try:
        self.driver.get('localhost:6969')
    # otherwise, try the standard port 80.
    except Exception, e:
        self.driver.get('localhost:80')

  def test_SocialMediaLinksPresent(self):
    linkToGitHub = self.driver.find_element_by_id('social-github')
    assert 'social-github' in linkToGitHub.get_attribute('id')

    linkToFaceBook = self.driver.find_element_by_id('social-facebook')
    assert 'social-facebook' in linkToFaceBook.get_attribute('id')

    linkToYouTube = self.driver.find_element_by_id('social-youtube')
    assert 'social-youtube' in linkToYouTube.get_attribute('id')

    linkToGoogleGroup = self.driver.find_element_by_id('social-googlegroup')
    assert 'social-googlegroup' in linkToGoogleGroup.get_attribute('id')

    linkToTwitter = self.driver.find_element_by_id('social-twitter')
    assert 'social-twitter' in linkToTwitter.get_attribute('id')

  def test_MeetingInfoIsPresent(self):
    meetingTimes = self.driver.find_element_by_id('meetingtimes')
    assert 'meetingtimes' in meetingTimes.get_attribute('id')

    meetingRooms = self.driver.find_element_by_id('meetingrooms')
    assert 'meetingrooms' in meetingRooms.get_attribute('id')

  def test_navBarLinksArePresent(self):
    homeLink = self.driver.find_element_by_id('nav-home')
    assert 'nav-home' in homeLink.get_attribute('id')

    eventsLink = self.driver.find_element_by_id('nav-events')
    assert 'nav-events' in eventsLink.get_attribute('id')assert 

    contactLink = self.driver.find_element_by_id('nav-contact')
    assert 'nav-contact' in contactLink.get_attribute('id')

    blogLink = self.driver.find_element_by_id('nav-blog')
    assert 'nav-blog' in blogLink.get_attribute('id')

    ircLink = self.driver.find_element_by_id('nav-irc')
    assert 'nav-irc' in ircLink.get_attribute('id')

  def test_calendarIsPresent(self):
    eventsCalendar = self.driver.find_element_by_id('events-calendar')
    assert 'events-calendar' in eventsCalendar.get_attribute('id')

  def test_contactsArePresent(self):
    presidentContact = self.driver.find_element_by_id('contacts-president')
    assert 'contacts-president' in presidentContact.get_attribute('id')

    advisorContact = self.driver.find_element_by_id('contacts-advisor')
    assert 'contacts-advisor' in advisorContact.get_attribute('id')

    treasurerContact = self.driver.find_element_by_id('contacts-treasurer')
    assert 'contacts-treasurer' in treasurerContact.get_attribute('id')

    codersClubEmail = self.driver.find_element_by_id('contacts-codersemail')
    assert 'contacts-codersemail' in codersClubEmail.get_attribute('id')


  def teardown(self):
    self.driver.close()