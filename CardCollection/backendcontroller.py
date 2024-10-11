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

class Example:  
    jsonSearchResults = Signal(str)  # Signal that sends JSON string
    jsonDiscoverResults = Signal(str)
    jsonLoadResults = Signal(str)

    def __init__(self):  
        pass  

    def myFunc(self):  
        pass  

    def myOtherFunc(self, parameter):  
        pass  