"""
BackendController Class Module
Handles any front end requests for backend interaction.
"""

from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

class BackendController:  
    jsonSearchResults = Signal(str)  # Signal that emits JSON string
    jsonDiscoverResults = Signal(str)  # Signal that emits JSON string
    jsonLoadResults = Signal(str)  # Signal that emits JSON string

    @Slot(list)
    def requestSearch(params: list[tuple[str, str, str]]):
        pass

    @Slot(list)
    def requestDiscover(params: list[tuple[str,str,str]]):
        pass

    @Slot()
    def requestLoadCollection():
        pass

    @Slot(list)
    def requestSaveCollection(params: list[tuple[str, str, str]]):
        pass
    