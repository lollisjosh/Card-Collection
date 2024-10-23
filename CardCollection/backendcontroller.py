from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

import json

#from requests.exceptions import RequestException

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
       # for param in params:
            #print("request_search called with params:")
            #print(param[0])
            #print(param[1])
            #print(param[2])

        try:
            search_handler = searchhandler.SearchHandler()            
            cards = search_handler.handle_request_search(params)

            if cards is not None:
                #print("Cards is not None")
                card_list = []

                for card in cards:
                      # Initialize ability names and descriptions
                    ability_1_Name = ""
                    ability_1_Text = ""
                    ability_1_Type = ""

                    ability_2_Name = ""
                    ability_2_Text = ""
                    ability_2_Type = ""

                    # Initialize attack names, descriptions, and costs
                    attack_1_Cost1 = attack_1_Cost2 = attack_1_Cost3 = attack_1_Cost4 = attack_1_Cost5 = ""
                    attack_1_Name = ""
                    attack_1_Text = ""                    
                    attack_1_Damg = ""
                    attack_1_Conv = 0

                    attack_2_Cost1 = attack_2_Cost2 = attack_2_Cost3 = attack_2_Cost4 = attack_2_Cost5 = ""
                    attack_2_Name = ""
                    attack_2_Text = ""                    
                    attack_2_Damg = ""
                    attack_2_Conv = 0

                    attack_3_Cost1 = attack_3_Cost2 = attack_3_Cost3 = attack_3_Cost4 = attack_3_Cost5 = ""
                    attack_3_Name = ""
                    attack_3_Text = ""                    
                    attack_3_Damg = ""
                    attack_3_Conv = 0

                    attack_4_Cost1 = attack_4_Cost2 = attack_4_Cost3 = attack_4_Cost4 = attack_4_Cost5 = ""
                    attack_4_Name = ""
                    attack_4_Text = ""                    
                    attack_4_Damg = ""
                    attack_4_Conv = 0

                    # Process abilities
                    if hasattr(card, 'abilities') and card.abilities is not None:
                        if len(card.abilities) > 0:
                            ability_1_Name = card.abilities[0].name
                            ability_1_Text = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                            ability_1_Type = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""
                        if len(card.abilities) > 1:
                            ability_2_Name = card.abilities[1].name
                            ability_2_Text = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                            ability_2_Type = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""

                    # Process attacks
                    if hasattr(card, 'attacks') and card.attacks is not None:

                        # Process Attack 1
                        if len(card.attacks) > 0:
                            attack_1_Cost = card.attacks[0].cost if hasattr(card.attacks[0], 'cost') else []
                            if len(attack_1_Cost) > 0:
                                attack_1_Cost1 = attack_1_Cost[0]
                            if len(attack_1_Cost) > 1:
                                attack_1_Cost2 = attack_1_Cost[1]
                            if len(attack_1_Cost) > 2:
                                attack_1_Cost3 = attack_1_Cost[2]
                            if len(attack_1_Cost) > 3:
                                attack_1_Cost4 = attack_1_Cost[3]
                            if len(attack_1_Cost) > 4:
                                attack_1_Cost5 = attack_1_Cost[4]
                            attack_1_Name = card.attacks[0].name
                            attack_1_Text = card.attacks[0].text if hasattr(card.attacks[0], 'text') else ""
                            attack_1_Damg = card.attacks[0].damage if hasattr(card.attacks[0], 'damage') else ""
                            attack_1_Conv = card.attacks[0].convertedEnergyCost if hasattr(card.attacks[0], 'convertedEnergyCost') else 0
                        
                        # Process Attack 2
                        if len(card.attacks) > 1:

                            attack_2_Cost = card.attacks[1].cost if hasattr(card.attacks[1], 'cost') else []
                            if len(attack_2_Cost) > 0:
                                attack_2_Cost1 = attack_2_Cost[0]
                            if len(attack_2_Cost) > 1:
                                attack_2_Cost2 = attack_2_Cost[1]
                            if len(attack_2_Cost) > 2:
                                attack_2_Cost3 = attack_2_Cost[2]
                            if len(attack_2_Cost) > 3:
                                attack_2_Cost4 = attack_2_Cost[3]
                            if len(attack_2_Cost) > 4:
                                attack_2_Cost5 = attack_2_Cost[4]
                            attack_2_Name = card.attacks[1].name
                            attack_2_Text = card.attacks[1].text if hasattr(card.attacks[1], 'text') else ""
                            attack_2_Damg = card.attacks[1].damage if hasattr(card.attacks[1], 'damage') else ""
                            attack_2_Conv = card.attacks[1].convertedEnergyCost if hasattr(card.attacks[1], 'convertedEnergyCost') else 0
                        
                        # Process Attack 3
                        if len(card.attacks) > 2:

                            attack_3_Cost = card.attacks[2].cost if hasattr(card.attacks[2], 'cost') else []
                            if len(attack_3_Cost) > 0:
                                attack_3_Cost1 = attack_3_Cost[0]
                            if len(attack_3_Cost) > 1:
                                attack_3_Cost2 = attack_3_Cost[1]
                            if len(attack_3_Cost) > 2:
                                attack_3_Cost3 = attack_3_Cost[2]
                            if len(attack_3_Cost) > 3:
                                attack_3_Cost4 = attack_3_Cost[3]
                            if len(attack_3_Cost) > 4:
                                attack_3_Cost5 = attack_3_Cost[4]
                            attack_3_Name = card.attacks[2].name
                            attack_3_Text = card.attacks[2].text if hasattr(card.attacks[2], 'text') else ""
                            attack_3_Damg = card.attacks[2].damage if hasattr(card.attacks[2], 'damage') else ""
                            attack_3_Conv = card.attacks[2].convertedEnergyCost if hasattr(card.attacks[2], 'convertedEnergyCost') else 0

                        # Process Attack 4
                        if len(card.attacks) > 3:
                            
                            attack_4_Cost = card.attacks[3].cost if hasattr(card.attacks[3], 'cost') else []
                            if len(attack_4_Cost) > 0:
                                attack_4_Cost1 = attack_4_Cost[0]
                            if len(attack_4_Cost) > 1:
                                attack_4_Cost2 = attack_4_Cost[1]
                            if len(attack_4_Cost) > 2:
                                attack_4_Cost3 = attack_4_Cost[2]
                            if len(attack_4_Cost) > 3:
                                attack_4_Cost4 = attack_4_Cost[3]
                            if len(attack_4_Cost) > 4:
                                attack_4_Cost5 = attack_4_Cost[4]
                            attack_4_Name = card.attacks[3].name
                            attack_4_Text = card.attacks[3].text if hasattr(card.attacks[3], 'text') else ""
                            attack_4_Damg = card.attacks[3].damage if hasattr(card.attacks[3], 'damage') else ""
                            attack_4_Conv = card.attacks[3].convertedEnergyCost if hasattr(card.attacks[3], 'convertedEnergyCost') else 0

                    # Append the card information to card_list
                    card_list.append({
                        "name": card.name,
                        "rarity": card.rarity,
                        "flavor": card.flavorText,
                        "imageUrl": card.images.large,
                        "set": card.set.name,
                        "setSymbol": card.set.images.symbol,
                        "setLogo": card.set.images.logo,

                        # Ability information
                        "ability1Name": ability_1_Name,
                        "ability1Text": ability_1_Text,
                        "ability1Type": ability_1_Type,

                        "ability2Name": ability_2_Name,
                        "ability2Text": ability_2_Text,
                        "ability2Type": ability_2_Type,

                        # Attack 1 information
                        "attack1Cost1": attack_1_Cost1,
                        "attack1Cost2": attack_1_Cost2,
                        "attack1Cost3": attack_1_Cost3,
                        "attack1Cost4": attack_1_Cost4,
                        "attack1Cost5": attack_1_Cost5,
                        "attack1Name": attack_1_Name,
                        "attack1Text": attack_1_Text,
                        "attack1Damage": attack_1_Damg,
                        "attack1ConvertedEnergyCost": attack_1_Conv,

                        # Attack 2 information
                        "attack2Cost1": attack_2_Cost1,
                        "attack2Cost2": attack_2_Cost2,
                        "attack2Cost3": attack_2_Cost3,
                        "attack2Cost4": attack_2_Cost4,
                        "attack2Cost5": attack_2_Cost5,
                        "attack2Name": attack_2_Name,
                        "attack2Text": attack_2_Text,
                        "attack2Damage": attack_2_Damg,
                        "attack2ConvertedEnergyCost": attack_2_Conv,

                        # Attack 3 information
                        "attack3Cost1": attack_3_Cost1,
                        "attack3Cost2": attack_3_Cost2,
                        "attack3Cost3": attack_3_Cost3,
                        "attack3Cost4": attack_3_Cost4,
                        "attack3Cost5": attack_3_Cost5,
                        "attack3Name": attack_3_Name,
                        "attack3Text": attack_3_Text,
                        "attack3Damage": attack_3_Damg,
                        "attack3ConvertedEnergyCost": attack_3_Conv,

                        # Attack 4 information
                        "attack4Cost1": attack_4_Cost1,
                        "attack4Cost2": attack_4_Cost2,
                        "attack4Cost3": attack_4_Cost3,
                        "attack4Cost4": attack_4_Cost4,
                        "attack4Cost5": attack_4_Cost5,
                        "attack4Name": attack_4_Name,
                        "attack4Text": attack_4_Text,
                        "attack4Damage": attack_4_Damg,
                        "attack4ConvertedEnergyCost": attack_4_Conv,
                    })

                # Emit the result as JSON
                #print("Card list to emit:", card_list)  # Debugging output

                self.searchResults.emit(json.dumps(card_list))

        except Exception as e:
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
