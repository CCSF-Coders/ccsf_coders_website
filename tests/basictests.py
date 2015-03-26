import unittest
from selenium import webdriver

class TestCodersMainPage(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get('localhost:80')

    def test_SocialMediaLinksPresent(self):
        linkToGitHub = self.driver.find_element_by_id('social-github')
        self.assertTrue('social-github' in linkToGitHub.get_attribute('id'))

        linkToFaceBook = self.driver.find_element_by_id('social-facebook')
        self.assertTrue('social-facebook' in linkToFaceBook.get_attribute('id'))

        linkToYouTube = self.driver.find_element_by_id('social-youtube')
        self.assertTrue('social-youtube' in linkToYouTube.get_attribute('id'))

        linkToGoogleGroup = self.driver.find_element_by_id('social-googlegroup')
        self.assertTrue('social-googlegroup' in linkToGoogleGroup.get_attribute('id'))

        linkToTwitter = self.driver.find_element_by_id('social-twitter')
        self.assertTrue('social-twitter' in linkToTwitter.get_attribute('id'))

    def test_MeetingInfoIsPresent(self):
        meetingTimes = self.driver.find_element_by_id('meetingtimes')
        self.assertTrue('meetingtimes' in meetingTimes.get_attribute('id'))

        meetingRooms = self.driver.find_element_by_id('meetingrooms')
        self.assertTrue('meetingrooms' in meetingRooms.get_attribute('id'))

    def test_navBarLinksArePresent(self):
        homeLink = self.driver.find_element_by_id('nav-home')
        self.assertTrue('nav-home' in homeLink.get_attribute('id'))

        eventsLink = self.driver.find_element_by_id('nav-events')
        self.assertTrue('nav-events' in eventsLink.get_attribute('id'))

        contactLink = self.driver.find_element_by_id('nav-contact')
        self.assertTrue('nav-contact' in contactLink.get_attribute('id'))
        
        blogLink = self.driver.find_element_by_id('nav-blog')
        self.assertTrue('nav-blog' in blogLink.get_attribute('id'))

        ircLink = self.driver.find_element_by_id('nav-irc')
        self.assertTrue('nav-irc' in ircLink.get_attribute('id'))

    def test_calendarIsPresent(self):
        eventsCalendar = self.driver.find_element_by_id('events-calendar')
        self.assertTrue('events-calendar' in eventsCalendar.get_attribute('id'))

    def test_contactsArePresent(self):
        presidentContact = self.driver.find_element_by_id('contacts-president')
        self.assertTrue('contacts-president' in presidentContact.get_attribute('id'))

        advisorContact = self.driver.find_element_by_id('contacts-advisor')
        self.assertTrue('contacts-advisor' in advisorContact.get_attribute('id'))

        treasurerContact = self.driver.find_element_by_id('contacts-treasurer')
        self.assertTrue('contacts-treasurer' in treasurerContact.get_attribute('id'))

        codersClubEmail = self.driver.find_element_by_id('contacts-codersemail')
        self.assertTrue('contacts-codersemail' in codersClubEmail.get_attribute('id'))

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()
