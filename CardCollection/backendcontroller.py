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
                    ability_1_Name = ""
                    ability_1_Desc = ""
                    ability_1_Type = ""

                    ability_2_Name = ""
                    ability_2_Desc = ""
                    ability_2_Type = ""

                    # Initialize attack names and descriptions
                    attack_1_Cost = ""
                    attack_1_Name = ""
                    attack_1_Text = ""                    
                    attack_1_Damg = ""
                    attack_1_Conv = ""

                    attack_2_Cost = ""
                    attack_2_Name = ""
                    attack_2_Text = ""                    
                    attack_2_Damg = ""
                    attack_2_Conv = ""

                    attack_3_Cost = ""
                    attack_3_Name = ""
                    attack_3_Text = ""                    
                    attack_3_Damg = ""
                    attack_3_Conv = ""

                    attack_4_Cost = ""
                    attack_4_Name = ""
                    attack_4_Text = ""                    
                    attack_4_Damg = ""
                    attack_4_Conv = ""


                    # Process abilities
                    if hasattr(card, 'abilities') and card.abilities is not None:
                        if len(card.abilities) > 0:
                            ability_1_Name = card.abilities[0].name
                            ability_1_Desc = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                            ability_1_Type = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""
                        if len(card.abilities) > 1:
                            ability_2_Name = card.abilities[1].name
                            ability_2_Desc = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                            ability_2_Type = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""

                    # Process attacks
                    if hasattr(card, 'attacks') and card.attacks is not None:
                        if len(card.attacks) > 0:
                            attack_1_Cost = card.attacks[0].cost if hasattr(card.attacks[0], 'cost') else []
                            attack_1_Name = card.attacks[0].name
                            attack_1_Text = card.attacks[0].text if hasattr(card.attacks[0], 'text') else ""
                            attack_1_Damg = card.attacks[0].damage if hasattr(card.attacks[0], 'damage') else ""
                            attack_1_Conv = card.attacks[0].convertedEnergyCost if hasattr(card.attacks[0], 'convertedEnergyCost') else 0

                        if len(card.attacks) > 1:
                            attack_2_Cost = card.attacks[1].cost if hasattr(card.attacks[1], 'cost') else []
                            attack_2_Name = card.attacks[1].name
                            attack_2_Text = card.attacks[1].text if hasattr(card.attacks[1], 'text') else ""
                            attack_2_Damg = card.attacks[1].damage if hasattr(card.attacks[1], 'damage') else ""
                            attack_2_Conv = card.attacks[1].convertedEnergyCost if hasattr(card.attacks[1], 'convertedEnergyCost') else 0

                        if len(card.attacks) > 2:
                            attack_3_Cost = card.attacks[2].cost if hasattr(card.attacks[2], 'cost') else []
                            attack_3_Name = card.attacks[2].name
                            attack_3_Text = card.attacks[2].text if hasattr(card.attacks[2], 'text') else ""
                            attack_3_Damg = card.attacks[2].damage if hasattr(card.attacks[2], 'damage') else ""
                            attack_3_Conv = card.attacks[2].convertedEnergyCost if hasattr(card.attacks[2], 'convertedEnergyCost') else 0

                        if len(card.attacks) > 3:
                            attack_4_Cost = card.attacks[3].cost if hasattr(card.attacks[3], 'cost') else []
                            attack_4_Name = card.attacks[3].name
                            attack_4_Text = card.attacks[3].text if hasattr(card.attacks[3], 'text') else ""
                            attack_4_Damg = card.attacks[3].damage if hasattr(card.attacks[3], 'damage') else ""
                            attack_4_Conv = card.attacks[3].convertedEnergyCost if hasattr(card.attacks[3], 'convertedEnergyCost') else 0



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
