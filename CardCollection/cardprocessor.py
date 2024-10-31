"""
File for CardProcessor class that turns Card objects indo list[dict[str,str]]
"""
class CardProcessor:
    """
    A utility class for processing Card objects into JSON-serializable formats.
    
    The CardProcessor class provides static methods for extracting and formatting key
    attributes from Card objects, including abilities, attacks, subtypes, and set details. 
    These methods help structure card data consistently, preparing it for use in frontend 
    applications or data storage.
    Methods:
    --------
    process_abilities(card: Card) -> dict
        Extracts ability information from a Card, returning names, descriptions, and types
        for up to two abilities.
    
    process_attacks(card: Card) -> dict
        Extracts attack information from a Card, including names, descriptions, and up to 
        five energy costs for each of up to four attacks.
    
    process_subtypes(card: Card) -> dict
        Extracts up to four subtypes from a Card's subtype list.
    
    process_cards(cards: list[Card]) -> list[dict]
        Processes a list of Card objects, combining attributes from abilities, attacks, 
        subtypes, and other basic card data into a list of JSON-serializable dictionaries.
    """

    @staticmethod
    def process_cards(cards):
        """
            Processes a list of Card objects, extracting key attributes and organizing them 
            into a list of dictionaries formatted for JSON serialization.
            Parameters:
            -----------
            cards : list[Card]
                A list of Card objects, each containing attributes such as abilities, attacks, 
                subtypes, name, and set details.
            Returns:
            --------
            list[dict[str, str]]
                A list of dictionaries, each representing a parsed Card with the following 
                attributes:
                    - Ability, attack, and subtype details from process_abilities, process_attacks, 
                    and process_subtypes.
                    - 'name': The card's name.
                    - 'id': The card's unique identifier.
                    - 'supertype': The card's supertype.
                    - 'imageUrl': URL to the card's large image.
                    - 'set': The name of the card's set.
                    - 'setSymbol': URL to the symbol image of the card's set.
                    - 'setLogo': URL to the logo image of the card's set.
                
                Any missing attributes are defaulted to empty strings by the helper methods.
            """
        processed_cards = []
        for card in cards:
            processed_card = {
                **CardProcessor.process_abilities(card),
                **CardProcessor.process_attacks(card),
                **CardProcessor.process_types(card),
                **CardProcessor.process_subtypes(card),
                "name": card.name,
                "id": card.id,
                "supertype": card.supertype,
                "imageUrl": card.images.large,
                "set": card.set.name,
                "setSymbol": card.set.images.symbol,
                "setLogo": card.set.images.logo,
            }
            processed_cards.append(processed_card)
        return processed_cards

    @staticmethod
    def process_abilities(card):
        """
        Processes the abilities of a given card object, returning a dictionary with details \
            for up to two abilities, including each ability's name, text, and type.
        Parameters:
        -----------
        card : Card
            The card object containing ability information, where each ability has attributes
            like 'name', 'text', and 'type'.
        Returns:
        --------
        dict
            A dictionary with keys for ability names, texts, and types: \
                - 'ability1Name', 'ability1Text', 'ability1Type' for the first ability. \
                - 'ability2Name', 'ability2Text', 'ability2Type' for the second ability. \
            If the card has no abilities, or lacks certain attributes, default values are empty strings.
        """
        abilities = {
            "ability1Name": "",
            "ability1Text": "",
            "ability1Type": "",
            "ability2Name": "",
            "ability2Text": "",
            "ability2Type": ""
        }

        if hasattr(card, 'abilities') and card.abilities:  # Check if abilities exists and is not None
            if len(card.abilities) > 0:
                abilities["ability1Name"] = card.abilities[0].name
                abilities["ability1Text"] = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                abilities["ability1Type"] = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""
            if len(card.abilities) > 1:
                abilities["ability2Name"] = card.abilities[1].name
                abilities["ability2Text"] = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                abilities["ability2Type"] = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""

        return abilities

    @staticmethod
    def process_attacks(card):
        """
        Processes the attacks of a given card object, returning a dictionary with \
        details for up to four attacks. Each attack includes the attack's \
        name, description, and up to five individual energy costs.\
        Parameters:
        -----------
        card : Card
            The card object containing attack information, \
            where each attack has attributes like \
            'name', 'text', and multiple 'cost' fields.
        Returns:
        --------
        dict
            A dictionary with keys for each attack's name, description, and energy costs:
                - 'attack1Name', 'attack1Text', 'attack1Cost1-5'for the 1st attack.
                - 'attack2Name', 'attack2Text', 'attack2Cost1-5'for the 2nd attack.
                - 'attack3Name', 'attack3Text', 'attack3Cost1-5'for the 3rd attack.
                - 'attack4Name', 'attack4Text', 'attack4Cost1-5'for the 4th attack.
                If the card has no attacks or lacks specific attributes, default values are \
                    set to empty strings for names and descriptions, or empty strings \
                        for each of the cost fields.
        """
        attacks = {}
        if hasattr(card, 'attacks') and card.attacks:  # Ensure attacks exists
            for i in range(4):
                attack_prefix = f"attack{i+1}"
                if len(card.attacks) > i:
                    attack = card.attacks[i]
                    cost = attack.cost if hasattr(attack, 'cost') and attack.cost else []
                    attacks.update({
                        f"{attack_prefix}Cost1": cost[0] if len(cost) > 0 else "",
                        f"{attack_prefix}Cost2": cost[1] if len(cost) > 1 else "",
                        f"{attack_prefix}Cost3": cost[2] if len(cost) > 2 else "",
                        f"{attack_prefix}Cost4": cost[3] if len(cost) > 3 else "",
                        f"{attack_prefix}Cost5": cost[4] if len(cost) > 4 else "",
                        f"{attack_prefix}Name": attack.name,
                        f"{attack_prefix}Text": attack.text if hasattr(attack, 'text') else "",
                        f"{attack_prefix}Damage": attack.damage if hasattr(attack, 'damage') else "",
                        f"{attack_prefix}ConvertedEnergyCost": attack.convertedEnergyCost if hasattr(attack, 'convertedEnergyCost') else 0
                    })
                else:
                    attacks.update({
                        f"{attack_prefix}Cost1": "",
                        f"{attack_prefix}Cost2": "",
                        f"{attack_prefix}Cost3": "",
                        f"{attack_prefix}Cost4": "",
                        f"{attack_prefix}Cost5": "",
                        f"{attack_prefix}Name": "",
                        f"{attack_prefix}Text": "",
                        f"{attack_prefix}Damage": "",
                        f"{attack_prefix}ConvertedEnergyCost": 0
                    })
        else:
            # If attacks is None or empty, set defaults
            for i in range(4):
                attack_prefix = f"attack{i+1}"
                attacks.update({
                    f"{attack_prefix}Cost1": "",
                    f"{attack_prefix}Cost2": "",
                    f"{attack_prefix}Cost3": "",
                    f"{attack_prefix}Cost4": "",
                    f"{attack_prefix}Cost5": "",
                    f"{attack_prefix}Name": "",
                    f"{attack_prefix}Text": "",
                    f"{attack_prefix}Damage": "",
                    f"{attack_prefix}ConvertedEnergyCost": 0
                })

        return attacks


    @staticmethod
    def process_types(card):
        
        types = {
            "type1": "",
            "type2": ""
        }

        if hasattr(card, 'types') and card.types:  # Check if types exists
            types["type1"] = card.types[0] if len(card.types) > 0 else ""
            types["type2"] = card.types[1] if len(card.types) > 1 else ""

        return types

    @staticmethod
    def process_subtypes(card):
        """
        Processes the subtypes of a given card object, returning a dictionary with up to 
        four subtypes.

        Parameters:
        -----------
        card : Card
            The card object containing subtype information, where subtypes are stored as
            a list of strings.

        Returns:
        --------
        dict
            A dictionary with keys for up to four subtypes:
                - 'subtype1' through 'subtype4' corresponding to the first through fourth
                subtypes in the card's subtype list.
            
            If the card has fewer than four subtypes or lacks specific attributes, the 
            remaining fields default to empty strings.
        """
        subtypes = {
            "subtype1": "",
            "subtype2": "",
            "subtype3": "",
            "subtype4": ""
        }

        if hasattr(card, 'subtypes') and card.subtypes:  # Check if subtypes exists
            subtypes["subtype1"] = card.subtypes[0] if len(card.subtypes) > 0 else ""
            subtypes["subtype2"] = card.subtypes[1] if len(card.subtypes) > 1 else ""
            subtypes["subtype3"] = card.subtypes[2] if len(card.subtypes) > 2 else ""
            subtypes["subtype4"] = card.subtypes[3] if len(card.subtypes) > 3 else ""


        return subtypes
