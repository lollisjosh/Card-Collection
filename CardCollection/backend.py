from pokemontcgsdk import Card, Set, RestClient

RestClient.configure('12345678-1234-1234-1234-123456789ABCD')

class Backend:
    def construct_query(self, search_parameters: list[tuple[str,str,str]]) -> str:
        """
        Constructs a query string from the given search parameters.
        Args:
            search_parameters (list[tuple[str,str,str]]): A list of tuples representing the search parameters.
              
        Returns:
            str: The constructed query string.
        """

    def query_api(self, query: str) -> list[Card]:
        """
        Queries the Pokemon TCG API using the constructed query string.
        Args: 
            query (str): The query string to spend to the API.
            
        Returns: 
            list[Card]: A list of Card objects returned by the API.
        """
    
    def all_sets(self) -> list[Set]:
        """
        Retrieves all available sets from the Pokemon TCG API.
        
        Returns:
            list[Set]: A list of Set objects retrieved from the API.
        """
