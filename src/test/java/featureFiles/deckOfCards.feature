Feature:Test Deck of cards API's

  Scenario: Get a list of resources or  deck from server
    Given url 'https://deckofcardsapi.com/api/deck/new/'
    And param jokers_enabled = true
    When method GET
    Then status 200
    And print response
    * print responseHeaders
    * def deckID = response.deck_id
    * print deckID


  Scenario: Shuffle cards using POST method
    Given url 'https://deckofcardsapi.com/api/deck/new/shuffle/'
#    * def value1 =  karate.quote(deckID)
#    * def value2 = deckID
#    * print 'Deck ID is : ', value2
#    * header deck_id=value2

#    And request {"deck_count": 6, "deck_id": "",value1}
    And request
  """
      {
    "deck_count":6
/*  "deck_id": "value2"*/

}
      """
    When method POST
    Then status 200
    And print response
    * print responseHeaders

  Scenario: Returning cards to the  deck
    * def value2 = deckID
    * print 'Deck ID is : ', value2
    Given url 'https://deckofcardsapi.com/api/deck/' + value2 + '/return'
#   And path value2
#    And path '/return'
#    And * print url
    When method GET
    Then response
    And * print response



