from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

import json

from inithandler import InitHandler
#import searchhandler

class BackendController(QObject):
    """
    Handles any front end requests for backend interaction.

    Args:
        QObject (_type_): Inheritance of QObject allows for the use of QT Signals and Slots

    ## Note:
    The `@Slot` decorator in this code is used to define a slot function that can be connected to a
    signal in a Qt application. Slots are functions or methods that can be called in response to a
    signal being emitted. By using the `@Slot` decorator, you are explicitly defining which functions
    can be connected to signals in the Qt framework. This helps in maintaining a clear separation
    between signals and slots in the codebase and ensures that the connections are set up correctly.
    """

    setsResults = Signal(str) # Signal that emits JSON string
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
        handler = InitHandler
        handler.handle_sets_retrieve(self)

    @Slot(list)
    def request_search(self, params: list[tuple[str, str, str]]):
        """
        ## Description:
            Provide an interface for the front end to make search requests with the given search parameters.
        Args:
            params (list[tuple[str, str, str]]): List of search parameter tuples of the form (category, subcategory, target)
        """
        card_list = []
        # Search for cards by name
        first_tuple = params[0]
        pokemon_name = first_tuple[2]
        cards = Card.where(q=f'name:{pokemon_name}')

        # For this test code we are only grabbing the 'name' and 'images.large' attributes of pokemontcgsdk.Card
        card_list = [{"name": card.name, "imageUrl": card.images.large} for card in cards]
        self.searchResults.emit(json.dumps(card_list))

    @Slot(list)
    def request_discover(self, params: list[tuple[str, str, str]]):
        """
        ## Description
            Provide an interface for the front end to make discover requests with the given parameters.

        Args:
            params (list[tuple[str, str, str]]): List of search parameter tuples of the form (category, subcategory, target)
        """

    @Slot()
    def request_load_collection(self):
        """
        ## Description
            Provide an interface for the front end to request teh back end to load and return the user's collection.

        Args:
            none: This function does not take any arguments.
        """

    @Slot(list)
    def request_save_collection(self, params: list[tuple[str, str, str]]):
        """
        ## Description
            Provide an interface for the front end to save users collection to system using the given parameters.

        Args:
            params (list[tuple[str, str, str]]): List of tuples of the form (category, subcategory, target) representing the users collection.
        """
