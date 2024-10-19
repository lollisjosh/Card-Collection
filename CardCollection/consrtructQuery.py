from typing import List, Tuple

def constructQuery(queryData: List[Tuple[str, str, str]]) -> str:
    # Initialize an empty dictionary to hold query parts
    query_parts = {}

    # Loop through each item in the queryData list
    for item in queryData:
        # Extract the category, subcategory, and target from the item
        category = item[0]
        subcategory = item[1]
        target = item[2]

        # Prepare the target for the query string with quotes
        target = f'"{target}"'  # Enclose target in quotes

        # If the category is not already in query_parts, create a new list for it
        if category not in query_parts:
            query_parts[category] = []

        # Check if subcategory is provided
        if subcategory:
            if category:
                # Create a string in the format "category.subcategory:target" and add it to the list
                query_parts[category].append(f"{category}.{subcategory}:{target}")
            else:
                # If no category, just "subcategory:target"
                query_parts[category].append(f"{subcategory}:{target}")
        else:
            if category:
                # Create a string in the format "category:target" and add it to the list
                query_parts[category].append(f"{category}:{target}")
            else:
                # If no category or subcategory, just "target"
                query_parts[category].append(target)

    # Prepare to construct the final query
    final_query_parts = []

    # Loop through each list of items in query_parts
    for items in query_parts.values():
        # If there is more than one item in the list
        if len(items) > 1:
            # Combine the items with "OR" and add parentheses around them
            final_query_parts.append(f"({' OR '.join(items)})")
        else:
            # If there's only one item, still wrap it in parentheses
            final_query_parts.append(f"({items[0]})")

    # Join all parts with "AND" to form the final query string
    final_query = " AND ".join(final_query_parts)
    print("constructQuery: Final query is {final_query}")
    return final_query
