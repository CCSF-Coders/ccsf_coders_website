import unittest
from selenium import webdriver

class TestCodersMainPage(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get('localhost:6969')

    def test_SocialMediaLinksPresent(self):
        linkToGitHub = self.driver.find_elements_by_id('social-github')
        self.assertTrue(linkToGitHub[0])

        linkToFaceBook = self.driver.find_elements_by_id('social-facebook')
        self.assertTrue(linkToFaceBook[0])

        linkToYouTube = self.driver.find_elements_by_id('social-youtube')
        self.assertTrue(linkToYouTube[0])

        linkToGoogleGroup = self.driver.find_elements_by_id('social-googlegroup')
        self.assertTrue(linkToGoogleGroup[0])

        linkToTwitter = self.driver.find_elements_by_id('social-twitter')
        self.assertTrue(linkToTwitter[0])

    def test_MeetingInfoIsPresent(self):
        meetingTimes = self.driver.find_elements_by_id('meetingtimes')
        self.assertTrue(meetingTimes[0])

        meetingRooms = self.driver.find_elements_by_id('meetingrooms')
        self.assertTrue(meetingRooms[0])

    def test_navBarLinksArePresent(self):
        homeLink = self.driver.find_elements_by_id('nav-home')
        self.assertTrue(homeLink[0])

        eventsLink = self.driver.find_elements_by_id('nav-events')
        self.assertTrue(eventsLink[0])

        contactLink = self.driver.find_elements_by_id('nav-contact')
        self.assertTrue(contactLink[0])
        
        blogLink = self.driver.find_elements_by_id('nav-blog')
        self.assertTrue(blogLink[0])

        ircLink = self.driver.find_elements_by_id('nav-irc')
        self.assertTrue(ircLink[0])

    def test_calendarIsPresent(self):
        eventsCalendar = self.driver.find_elements_by_id('events-calendar')
        self.assertTrue(eventsCalendar[0])

    def test_contactsArePresent(self):
        presidentContact = self.driver.find_elements_by_id('contacts-president')
        advisorContact = self.driver.find_elements_by_id('contacts-advisor')
        treasurerContact = self.driver.find_elements_by_id('contacts-treasurer')
        codersClubEmail = self.driver.find_elements_by_id('contacts-codersemail')

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    suite = unittest.TestLoader().loadTestsFromTestCase(TestCodersMainPage)
    unittest.TextTestRunner(verbosity=2).run(suite)
