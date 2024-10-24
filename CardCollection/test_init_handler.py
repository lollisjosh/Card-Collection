# test_init_handler.py

import unittest
from unittest.mock import patch
from pokemontcgsdk import Set
import backend
from inithandler import InitHandler

class TestInitHandler(unittest.TestCase):
    @patch('backend.Backend.all_sets')
    def test_handle_sets_retrieve(self, mock_all_sets):
        # Mock data for sets with all required parameters
        mock_sets = [
            Set(
                id='base1',
                name='Base Set',
                images={},
                legalities={},
                printedTotal=102,
                ptcgoCode='BS1',
                releaseDate='1996-01-01',
                series='Base',
                total=102,
                updatedAt='2022-01-01T00:00:00Z'
            ),
            Set(
                id='base2',
                name='Jungle Set',
                images={},
                legalities={},
                printedTotal=64,
                ptcgoCode='JU',
                releaseDate='1999-06-16',
                series='Jungle',
                total=64,
                updatedAt='2022-01-01T00:00:00Z'
            ),
            Set(
                id='basep',
                name='Wizards Black Star Promos',
                images={},
                legalities={},
                printedTotal=53,
                ptcgoCode='BSP',
                releaseDate='2000-01-01',
                series='Black Star Promos',
                total=53,
                updatedAt='2022-01-01T00:00:00Z'
            ),
            Set(
                id='sm12',
                name='Cosmic Eclipse',
                images={},
                legalities={},
                printedTotal=247,
                ptcgoCode='CEC',
                releaseDate='2019-11-01',
                series='Sun & Moon',
                total=247,
                updatedAt='2022-01-01T00:00:00Z'
            ),
            Set(
                id='sv1',
                name='Scarlet & Violet',
                images={},
                legalities={},
                printedTotal=198,
                ptcgoCode='SV1',
                releaseDate='2023-03-01',
                series='Scarlet & Violet',
                total=198,
                updatedAt='2022-01-01T00:00:00Z'
            ),
            Set(
                id='sv4',
                name='Paradox Rift',
                images={},
                legalities={},
                printedTotal=199,
                ptcgoCode='SV4',
                releaseDate='2023-09-01',
                series='Scarlet & Violet',
                total=199,
                updatedAt='2022-01-01T00:00:00Z'
            ),
        ]
        mock_all_sets.return_value = mock_sets

        handler = InitHandler()

        # Call the method to be tested
        result = handler.handle_sets_retrieve()

        # Print out details for debugging and feedback
        print(f"Received {len(result)} sets from handle_sets_retrieve.")
        for i, s in enumerate(result, start=1):
            print(f"Set {i}: Name: {s.name}, ID: {s.id}, Series: {s.series}")

        # Assert that the backend's all_sets method was called once
        mock_all_sets.assert_called_once()

        # Assert that the result is the mock sets
        self.assertEqual(result, mock_sets)

        # Verify individual set names and ids in the result
        for mock_set in mock_sets:
            self.assertIn(mock_set, result)
            print(f"Verified set: Name: {mock_set.name}, ID: {mock_set.id}")

if __name__ == '__main__':
    unittest.main()
