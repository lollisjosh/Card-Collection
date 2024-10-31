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

    def handle_discover(self, param_list : list[tuple[str,str,str]]) -> list[dict[str,str]]:
        """
        Summary:
            The main function in the `DiscoverHandler` that utilizes the 
                `Backend.fetch_data` function \
                `CardProcessor.process_cards` functions, 
                along with its internal `random_select_set` \
                and `random_select_type` functions, in order to return a randomized result back \
                to the calling client in the form of a list[dict[str, str]] \
                that should only contain 1 `Card` object.

        Args:
            self : The self object
            param_list : A list[tuple[str, str, str]] from which to 
                generate a randomized search result.

        Return:
            discover_result : list[dict[str, str]] representing the randomly discovered card. 
                This list actually only has one element  for 
                    compatibility purposes it should still be a list.
        """

    def random_select_set(self, select_list : list[tuple[str,str,str]]) -> tuple[str,str,str]:
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

        temp = [element for sublist in select_list for element in sublist if element[0] == 'set']
        if temp:
            return random.choice(temp)
        else:
            print("No set found.")
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
