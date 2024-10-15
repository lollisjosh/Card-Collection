# Class/Backend

class Backend:
    def construct_query(self, search_parameters: list[tuple]) -> str:
        pass
            # Constructs a query string from the given search parameters
            # Arguments: search_parameters (list[tuple]): A list of tuples representing the searc h parameters
            
            # Returns: str: The constructed query string


    def query_api(self, query: str)->list['Card']:
        pass
            # Queries the API using the constructed query string
            #Arguments: query(str): The query string to send to the API

            # Returns: list[Card]: A list of Card objects returned by the API



    def all_sets(self) -> list['Set']:
        
            # Retrieves all available sets from the API

            # Returns: list[Sets]; A list of Set objects retrieved from the API


        sets_list = Set.all()
        return sets_list

