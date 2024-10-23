def handle_search(tupleList):
    """
    This function constructs a query based on the input tuple list,
    calls an API using the constructed query, and returns the result.
    
    Args:
        tupleList (list): A list of tuples to construct the query.
        
    Returns:
        list: A list of cards retrieved from the API.
    """
    query = construct_query(tupleList)
    
    return queryApi(query)