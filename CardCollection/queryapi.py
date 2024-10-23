def queryApi(query):
    """
    This function sends a query to retrieve card data and returns the result.
    
    Args:
        query (str): The query string to filter the card data.
        
    Returns:
        list: A list of card data matching the query.
    """
    
    return Card.where(query)