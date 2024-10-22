from backend import Backend


class SearchHandler:


    def handle_search(self, search_parameters: list[tuple[str, str, str]]) -> list:

        """
        Constructs a query string using the Backend class, construct_query function.

        Args:
        tuple_list: A list of tuples representing search parameters.

        returns:
        A list of Card objects as "cardResults".
        """