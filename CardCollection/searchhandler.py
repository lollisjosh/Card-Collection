# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass
from pokemontcgsdk import Card
from backend import Backend

class SearchHandler:
    def handle_request_search(self, params : list[tuple[str,str,str]]) -> list[Card]:
        back = Backend()
        query = back.constructQuery(params)
        cards = back.query_api(query)
        return cards
