from backend import Backend

class SearchHandler:
    """
    A class that handles search operations by constructing queries and retrieving results.

    Methods:
        handle_search(search_parameters): Constructs a query string using the Backend class, construct_query function.
    """
    def handle_search(self, search_parameters: list[tuple[str, str, str]]) -> list[Card]:
        """
        Constructs a query string using the Backend class, construct_query function.

        Args:
            search_parameters (List[Tuple[str, str, str]]): A list of tuples where each tuple contains:
                - category (str): The main category for the search.
                - subcategory (str): The subcategory to refine the search.
                - target (str): The search target (value being searched).

        Returns:
            list[Card]: A list of Card objects as search results.
        """