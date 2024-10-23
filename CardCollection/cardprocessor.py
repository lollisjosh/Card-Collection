class CardProcessor:
    @staticmethod
    def process_cards(cards: list):
        """
        Process a list of card objects and return a list of processed card data.
        Args:
            cards (list): List of card objects.
        Returns:
            list: List of dictionaries with processed card data.
        """
        processed_cards = []
        for card in cards:
            processed_cards.append({
                "name": card.name,
                "rarity": card.rarity,
                "supertype": card.supertype,
                "flavor": card.flavorText,
                "imageUrl": card.images.large,
                "set": card.set.name,
                "setSymbol": card.set.images.symbol,
                "setLogo": card.set.images.logo,
                **CardProcessor.process_abilities(card),
                **CardProcessor.process_attacks(card),
                **CardProcessor.process_subtypes(card)
            })
        return processed_cards

    @staticmethod
    def process_abilities(card):
        """
        Process the abilities of a card.
        Args:
            card: The card object containing abilities.
        Returns:
            dict: Dictionary containing ability names, descriptions, and types.
        """
        abilities = {
            "ability1Name": "",
            "ability1Desc": "",
            "ability1Type": "",
            "ability2Name": "",
            "ability2Desc": "",
            "ability2Type": ""
        }

        if hasattr(card, 'abilities') and card.abilities:
            if len(card.abilities) > 0:
                abilities["ability1Name"] = card.abilities[0].name
                abilities["ability1Desc"] = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                abilities["ability1Type"] = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""
            if len(card.abilities) > 1:
                abilities["ability2Name"] = card.abilities[1].name
                abilities["ability2Desc"] = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                abilities["ability2Type"] = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""

        return abilities

    @staticmethod
    def process_attacks(card):
        """
        Process the attacks of a card.
        Args:
            card: The card object containing attacks.
        Returns:
            dict: Dictionary containing attack details.
        """
        attacks = {}
        for i in range(4):
            attack_prefix = f"attack{i+1}"
            if len(card.attacks) > i:
                attack = card.attacks[i]
                cost = attack.cost if hasattr(attack, 'cost') else []
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
        return attacks

    @staticmethod
    def process_subtypes(card):
        """
        Process the subtypes of a card.
        Args:
            card: The card object containing subtypes.
        Returns:
            dict: Dictionary containing the first and second subtypes.
        """
        subtypes = {
            "subtype1": "",
            "subtype2": ""
        }

        if hasattr(card, 'subtypes') and card.subtypes:
            subtypes["subtype1"] = card.subtypes[0] if len(card.subtypes) > 0 else ""
            subtypes["subtype2"] = card.subtypes[1] if len(card.subtypes) > 1 else ""

        return subtypes
