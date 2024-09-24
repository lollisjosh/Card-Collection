import sys
from pathlib import Path
from PySide6.QtCore import QObject, Slot, Signal
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from pokemontcgsdk import RestClient, Card, Set
import json

# Configure the RestClient with your API key
RestClient.configure('12345678-1234-1234-1234-123456789ABC')

class PokemonAPI(QObject):
    resultFetched = Signal(str)  # Signal that sends JSON string

    def __init__(self):
        super().__init__()

    @Slot(str)
    def search_card(self, card_name):
        try:
            # Search for cards by name
            cards = Card.where(q=f'name:{card_name}')

            # For this test code we are only grabbing the 'name' and 'images.large' attributes of pokemontcgsdk.Card
            card_list = [{"name": card.name, "imageUrl": card.images.large} for card in cards]

            # Emit a list of results
            self.resultFetched.emit(json.dumps(card_list))

        except Exception as e:
            self.resultFetched.emit(json.dumps({"error": str(e)}))



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()


    api = PokemonAPI()
    engine.rootContext().setContextProperty("api", api)

    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())



'''
    if __name__ == "__main__":
        # Check if the script is run directly (not imported as a module)
        app = QGuiApplication(sys.argv)
        # Create a QGuiApplication instance to manage the GUI application's control flow and main settings.

        engine = QQmlApplicationEngine()
        # Create a QQmlApplicationEngine instance for loading and managing the QML interface.

        api = PokemonAPI()
        # Instantiate the PokemonAPI class. This custom class handles API calls or data processing related to Pokémon.

        engine.rootContext().setContextProperty("api", api)
        # Expose the `api` object to the QML context as a property named "api" so that it can be accessed and used within QML.

        qml_file = Path(__file__).resolve().parent / "main.qml"
        # Construct the full path to the QML file (main.qml) relative to the current Python file's location.

        engine.load(qml_file)
        # Load the main.qml file into the QML engine to set up the UI.

        if not engine.rootObjects():
            # Check if any root objects were created (e.g., the main window).
            # If no root objects were created, it indicates an issue with loading the QML file.
            sys.exit(-1)
            # Exit the application with an error code (-1).

        sys.exit(app.exec())
        # Start the event loop of the application to handle user interactions and GUI updates.
        # Exit the application with the status code returned by `app.exec()`.

'''
