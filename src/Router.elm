module Router exposing (Route(..), parseRoute)

import UrlParser exposing (Parser, (</>), top, oneOf, parseHash)
import Navigation exposing (Location)


-- Type declerations for each page


type Route
    = Home



-- This routes to the diffirent pages


router : Parser (Route -> a) a
router =
    oneOf
        [ UrlParser.map Home top
        ]



-- This converts a location into a route


parseRoute : Location -> Maybe Route
parseRoute location =
    parseHash router location
