from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

import json

from requests.exceptions import RequestException

import inithandler
import searchhandler


class BackendController(QObject):
    """
    Handles any front end requests for backend interaction.

    Args:
         QObject: Inheritance of QObject allows for the use of QT Signals and Slots

    ## Note:
    The `@Slot` decorator in this code is used to define a slot function that can be connected to a
    signal in a Qt application. Slots are functions or methods that can be called in response to a
    signal being emitted. By using the `@Slot` decorator, you're explicitly defining which functions
    can be connected to signals in the Qt framework. This helps in maintaining a clear separation
    between signals and slots in the codebase and ensures that the connections are set up correctly.
    """

    setsResults = Signal(str)  # Signal that emits JSON string
    searchResults = Signal(str)  # Signal that emits JSON string
    discoverResults = Signal(str)  # Signal that emits JSON string
    loadResults = Signal(str)  # Signal that emits JSON string

    @Slot()
    def request_sets_retrieve(self):
        """
        ## Description:
            Provide an interface for the front end to retrieve all available sets.
        Args:
            params none
        """
        try:
            
            initHandler = inithandler.InitHandler()
            
            sets = initHandler.handle_sets_retrieve()
            
            setList = [{"name" : set.name} for set in sets]
            
            self.setsResults.emit(json.dumps(setList))
        
        except Exception as e:
            self.setsResults.emit(json.dump({"error": str(e)}))

    @Slot(list)
    def request_search(self, params: list[tuple[str, str, str]]):
        """
        ## Description:
            Provide an interface for the front end 
            to make search requests with the given search parameters.
        Args:
            params (list[tuple[str, str, str]]): 
                List of search parameter tuples of the form (category, subcategory, target)
        """
        try: 
            search_handler = searchhandler.SearchHandler()
            cards = search_handler.handle_request_search(params)

            if cards is not None:
                card_list = []
                
                for card in cards:

                    # Initialize ability names and descriptions
                    ability1Name = ""
                    ability1Desc = ""
                    ability1Type = ""
                    ability2Name = ""
                    ability2Desc = ""
                    ability2Type = ""

                    # Initialize attack names and descriptions
                    attack1Name = ""
                    attack1Desc = ""
                    attack2Name = ""
                    attack2Desc = ""
                    attack3Name = ""
                    attack3Desc = ""
                    attack4Name = ""
                    attack4Desc = ""

                    # Process abilities
                    if hasattr(card, 'abilities') and card.abilities is not None:
                        if len(card.abilities) > 0:
                            ability1Name = card.abilities[0].name
                            ability1Desc = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                            ability1Type = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""

                        if len(card.abilities) > 1:
                            ability2Name = card.abilities[1].name
                            ability2Desc = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                            ability2Type = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""


        except RequestException as e:  # Catching HTTP request-related exceptions
                self.searchResults.emit(json.dumps({"error": "Request error: " + str(e)}))
        except ValueError as e:  # Catching JSON parsing or value-related issues
            self.searchResults.emit(json.dumps({"error": "Value error: " + str(e)}))
        except KeyError as e:  # Catching dictionary key access issues
            self.searchResults.emit(json.dumps({"error": "Key error: " + str(e)}))
        except TypeError as e:  # Catching type mismatch errors
            self.searchResults.emit(json.dumps({"error": "Type error: " + str(e)}))
        except Exception as e:  # Fallback for any other unexpected errors
            self.searchResults.emit(json.dumps({"error": "Unexpected error: " + str(e)}))            
            self.searchResults.emit(json.dumps({"error": str(e)}))

    @Slot(list)
    def request_discover(self, params: list[tuple[str, str, str]]):
        """
        ## Description
            Provide an interface for the front end 
            to make discover requests with the given parameters.

        Args:
            params (list[tuple[str, str, str]]): 
                List of search parameter tuples of the form (category, subcategory, target)
        """

    @Slot()
    def request_load_collection(self):
        """
        ## Description
            Provide an interface for the front end 
            to request teh back end to load and return the user's collection.

        Args:
            none: This function does not take any arguments.
        """

    @Slot(list)
    def request_save_collection(self, params: list[tuple[str, str, str]]):
        """
        ## Description
            Provide an interface for the front end 
            to save users collection to system using the given parameters.

        Args:
            params (list[tuple[str, str, str]]): 
                List of tuples of the form (category, subcategory, target)
        """
