from pokemontcgsdk import Card
from backend import Backend
from cardprocessor import CardProcessor
import random


class DiscoverHandler:
    """
    DiscoverHandler Class:
    
    Summary:
        The `DiscoverHandler` class provides methods to discover a 
            single random card based on search criteria. 
        The class uses `Backend.fetch_data` to retrieve data and 
            `CardProcessor.process_cards` for data processing.
        
    Methods:
        handle_discover:
            Returns a single card matching randomized criteria from a list of possible parameters.
            
        random_select_set:
            Randomly selects a set from the input list of sets.
            
        random_select_type:
            Randomly selects a type from the input list of types.
    """

    def handle_discover(self, param_list: list[tuple[str, str, str]]) -> list[dict[str, str]]:
        print([element for element in param_list if element[0] != 'set'])

        randomSet = DiscoverHandler.random_select_set(param_list)

        # Initialize tempList with tuples from param_list not starting with 'set'
        tempList = [element for element in param_list if element[0] != 'set']

        # Append randomSet to tempList if randomSet is not None
        if randomSet is not None:
            tempList.append(randomSet)

        query = Backend.construct_query(self, tempList)

        print("Query: " + query)

        results = Backend.query_api(self, query)

        processed_cards = CardProcessor.process_cards(results)

        randomChoice = []
        randomChoice.append(random.choice(processed_cards))

        return randomChoice

    def random_select_set(select_list : list[tuple[str,str,str]]) -> tuple[str,str,str]:
        """
        Summary:
            Randomly selects a set from the provided list of sets.

        Args:
            self : The self object
            select_list : A list[tuple[str, str, str]] representing the 
                available sets to choose from.

        Return:
            A tuple[str, str, str] representing the randomly selected set.
        """

        temp = [element for element in select_list if element[0] == 'set']
        if temp:
            randomChoice = random.choice(temp)
            print(randomChoice)
            return randomChoice
        else:
            #print("No set found.")
            return None

    def random_select_type(self, select_list : list[tuple[str, str, str]]) -> tuple[str,str,str]:
        """
        Summary:
            Randomly selects a type from the provided list of types.

        Args:
            self : The self object
            select_list : A list[tuple[str, str, str]] representing the
                available types to choose from.

        Return:
            A tuple[str, str, str] representing the randomly selected type.
        """
