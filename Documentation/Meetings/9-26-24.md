# Meeting Notes

**Date:** 9/26/24 \
**Attendees:** Batu, Christian, Josh \
**Absent:** 

## 11:30 AM Meeting

1. **Batu's QT Install Update**
   - Checked if Batu could run the project on his QT installation. He is currently unable to but has the software and licenses installed and ready.

2. **Filtering UI on Search Page**
   - Discussed the search page’s filtering UI, where users can:
     - Optionally enter a Pokémon name.
     - Optionally select a card set.
     - Select any combination of 11 Pokémon types.
   - Clarified the distinction between finding Pokémon that match **Type1 OR Type2** versus **Type1 AND Type2**.
   - Decided to implement the former for now, returning all Pokémon matching any selected type, alongside other criteria. The search logic will be:  
     **((Set Name) AND (Pokémon Name) AND (Type1 OR TypeN))**.

3. **Program Flow Overview**
   - Discussed how data flows from the search button click on the UI, to the back end, and then to the RESTful API.

4. **Data Passing and Query Construction**
   - Considered using a map to pass collected form data to the back end. The back end will then construct a query string to send to the RESTful API.

5. **Combo Box Functionality**
   - Discussed the concept of a combo box, explaining that it is essentially an indexed array.

6. **Search Page Elements Overview**
   - Defined the broad elements of the search page:
     - **Front End**: Search button, search text box, set selection combo box, Pokémon type-filter buttons, display area, and previous/next buttons.
     - **Back End**: `SearchCards` function, `BuildQuery` function, `onSearchClicked` function, with more functions to be determined.

## Action Items (11:30 AM)
- **Batu**: Troubleshoot QT issues on Mac, or switch to another system for now. Get more acquainted with the PokémonTCGSDK Python SDK in the Python interpreter.
- **Christian**: Work on progress report 3.
- **Josh**: Prototype the data passing using a map to test feasibility. Figure out what the API needs to perform the type of query with the **((A) AND (B) AND (X OR Y))** structure discussed. Determine the tasks needed to progress through the modeling phase.

---

## 2:00 PM Meeting

**Attendees:** Christian, Josh \
**Absent:** Batu

### Agenda

1. **Review Project Flow and Filtering Concepts**
   - Reviewed the project flow and filtering concepts discussed in the earlier meeting.

2. **Address Christian's Questions**
   - Answered questions Christian had regarding program flow.

3. **Prototype Presentation**
   - Josh presented a prototype demonstrating passing data from the front end to the back end using a map structure.

4. **Build Query Function Refinement**
   - Fine-tuned what the "Build Query" function does and what a query looks like, considering the logic discussed earlier.

5. **Review of Previous Topics**
   - Most of the meeting was a deeper review of the previous meeting topics rather than covering new ground.

6. **Python SDK Explanation**
   - Demonstrated writing functions in Python directly in the interpreter and used this to explain interacting with the API. Josh explained that the SDK is a wrapper around the RESTful API operations, such as GET and POST, which could be manually implemented in other languages without an SDK.

### Action Items (2:00 PM)
- **Batu**: Troubleshoot QT issues on Mac, or switch to another system for now. Get more acquainted with the PokémonTCGSDK Python SDK in the Python interpreter.
- **Christian**: Work on progress report 3. Get better acquainted with the PokémonTCGSDK Python API through the Python interpreter.
- **Josh**: Prototype the data passing using a map to test feasibility. Figure out what the API needs to perform the type of query with the **((A) AND (B) AND (X OR Y))** structure discussed. Determine the tasks needed to progress through the modeling phase.
