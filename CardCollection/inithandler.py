from pokemontcgsdk import Set
from backend import Backend

class InitHandler:
    """
    Handles any front end requests for requesting data for the front end to initalize components.
    """

    def handle_sets_retrieve(self) -> list[Set]:
        """
        ## Description:
            Provide an interface for the front end to retrieve all available sets.
        Args:
            params none
        """
        back = Backend()
        return back.all_sets()
