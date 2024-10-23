from pokemontcgsdk import Set
import backend

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

        # call backend's all_sets function to retrieve sets
        sets = backend.Backend.all_sets(self)

        # check if sets is empty
        # if empty, print none, if not empty, print each set name in sets.
        if sets:
            # named set_ to not redefine set
            for set_ in sets:
                print(set_.name())
        else:
            print("No sets found.")
        return sets
