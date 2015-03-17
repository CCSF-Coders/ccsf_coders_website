from selenium.webdriver.common.by import By

class BasePage(object):

    def __init__(self, driver):
        self.driver = driver

class MainPage(BasePage):

    def gitHubLinkIsPresent(self):
        gitHubLinkShouldBe = 'https://github.com/CCSF-Coders'
        linkToGitHub = self.driver.find_elements_by_css_selector("a[href='"+gitHubLinkShouldBe+"']")
        if (linkToGitHub == gitHubLinkShouldBe):
            return True
        else:
            return False

    def faceBookLinkIsPresent(self):
        faceBookLinkShouldBe = 'https://facebook.com/ccsfcoders'
        linkToFaceBook = self.driver.find_elements_by_css_selector("a[href='"+faceBookLinkShouldBe+"']")
        if (linkToFaceBook == faceBookLinkShouldBe):
            return True
        else:
            return False

    def youTubeLinkIsPresent(self):
        youTubeLinkShouldBe = 'https://www.youtube.com/user/CCSFCoders'
        linkToYouTube = self.driver.find_elements_by_css_selector("a[href='"+youTubeLinkShouldBe+"']")
        if (linkToYouTube == youTubeLinkShouldBe):
            return True
        else:
            return False

    def googleGroupLinkIsPresent(self):
        googleGroupLinkShouldBe = 'https://groups.google.com/forum/#!forum/ccsfcoders'
        linkToGoogleGroup = self.driver.find_elements_by_css_selector("a[href='"+linkToGoogleGroup+"']")
        if (linkToGoogleGroup == googleGroupLinkShouldBe):
            return True
        else:
            return False

    def twitterLinkIsPresent(self):
        twitterLinkShouldBe = 'https://twitter.com/ccsfcoders`'
        linkToTwitter = self.driver.find_elements_by_css_selector("a[href='"+twitterLinkShouldBe+"']")
        print linkToTwitter
        print twitterLinkShouldBe
        if (linkToTwitter == twitterLinkShouldBe):
            return True
        else:
            return False