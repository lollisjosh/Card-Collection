

from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

class BackendController(QObject):
    """
    Handles any front end requests for backend interaction.

    Args:
        QObject (_type_): Inheritance of QObject allows for the use of QT Signals and Slots
    """
    jsonSearchResults = Signal(str)  # Signal that emits JSON string
    jsonDiscoverResults = Signal(str)  # Signal that emits JSON string
    jsonLoadResults = Signal(str)  # Signal that emits JSON string

    @Slot(list)
    def request_search(self, params: list[tuple[str, str, str]]):
        """
        Provide an interface for the front end to make search requests with the given search parameters.

        Args:
            params (list[tuple[str, str, str]]): List of search parameter tuples of the form (category, subcategory, target)
        """

    @Slot(list)
    def request_discover(self, params: list[tuple[str,str,str]]):
        """
        The function `requestDiscover` takes a list of tuples as input parameters.
        
        :param params: The `requestDiscover` method takes a list of tuples as the `params` parameter.
        Each tuple in the list should contain three strings
        :type params: list[tuple[str,str,str]]
        """

    @Slot()
    def request_load_collection(self):
        """
        The function `requestLoadCollection` is defined in Python but does not contain any code inside
        its body.
        """
        
    @Slot(list)
    def request_cave_collection(self, params: list[tuple[str, str, str]]):
        """
        The function `requestSaveCollection` takes a list of tuples as input parameters.
        
        :param params: The `requestSaveCollection` function takes a parameter `params`, which is a list
        of tuples. Each tuple in the list contains three strings
        :type params: list[tuple[str, str, str]]
        """
        
