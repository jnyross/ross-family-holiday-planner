
# GPT-5 Pro Prompt: Comprehensive Destination Data Research for Family Holiday Planner

## 1. OVERVIEW

**Objective**: Research and compile verified data for 20-50 family-friendly holiday destinations per session. Your primary goal is to expand our database from 112 to over 200 destinations with high-quality, structured data suitable for a PostgreSQL database.

**Your Role**: You are a research assistant tasked with gathering accurate and verifiable data using your web search capabilities. You must adhere strictly to the specified JSON output format and follow the data verification and sourcing guidelines outlined below.

**Core Task**: For each destination provided, you will perform web research to populate a set of data fields, including basic information, flight logistics, family-friendliness ratings, accommodation metrics, and monthly climate data.

---

## 2. RESEARCH METHODOLOGY & DATA SOURCES

You are required to use your web search capabilities to find and verify all data points. Prioritize authoritative and reliable sources.

### 2.1. Source Prioritization

1.  **Official Tourism Boards**: The most reliable source for general information, country, and region. (e.g., `visitgreece.gr`, `tourismthailand.org`).
2.  **Major Weather Aggregators**: For historical climate data.
    *   **Primary**: `weather.com`, `worldweatheronline.com`, `timeanddate.com/weather`
    *   **Secondary**: Reputable travel guides that cite their weather sources.
3.  **Flight Comparison Sites**: For flight times.
    *   **Primary**: `skyscanner.net`, `kayak.co.uk`, `google.com/flights` (use direct flight times from London, UK).
4.  **Accommodation & Review Sites**: For ratings and hotel data.
    *   **Primary**: `tripadvisor.com`, `booking.com`, `expedia.com`.
    *   **Secondary**: Reputable family travel blogs for qualitative assessments (e.g., "The Family Vacation Guide," "Have Baby Will Travel").
5.  **Official Time/Date Sources**: For time zone information (e.g., `timeanddate.com`, `greenwichmeantime.com`).

### 2.2. Data Verification Mandate

**CRITICAL**: You must cross-reference data across at least two independent sources, especially for climate and flight data. If sources conflict, either take the average or prioritize the most authoritative source (e.g., an official government weather service over a generic travel blog). You **must** list the URLs of your primary sources in the `data_sources` array for each destination.

---

## 3. REQUIRED DATA FIELDS & INSTRUCTIONS

For each destination, populate the following fields and adhere to the specified data types and constraints.

### 3.1. Basic Info
*   `name` (string): The common English name of the destination (e.g., "Barcelona", "Phuket", "Santorini").
*   `country` (string): The country where the destination is located.
*   `region` (string): The geographical region. Must be one of: `Europe`, `Asia`, `Caribbean`, `Middle East`, `North America`, `South America`, `Africa`, `Oceania`.

### 3.2. Flight & Logistics (from London, UK)
*   `flight_hours` (decimal): The average non-stop flight time from a major London airport (LHR, LGW) in hours. Use a decimal format (e.g., `2.5`, `8.0`, `12.5`). If only direct flights are available, use that. If multiple stops are common, provide an estimated total travel time.
*   `time_difference` (integer): The time difference in hours from GMT/UTC during the main tourist season. Use positive integers for time ahead of GMT (e.g., `+2`) and negative for time behind (e.g., `-5`).

### 3.3. Family Ratings (1-5 Scale)
*   `beach_pool_quality` (integer): A rating from 1 to 5.
    *   **5**: World-class, pristine beaches with calm waters and/or exceptional resort pools with extensive features (slides, kids' areas).
    *   **4**: High-quality, clean beaches and/or very good hotel pools.
    *   **3**: Decent, accessible beaches or standard hotel pools.
    *   **2**: Limited or poor-quality beaches/pools.
    *   **1**: No significant beach or pool facilities.
*   `kid_facilities_quality` (integer): A rating from 1 to 5 based on the availability and quality of amenities for children (ages 0-7).
    *   **5**: Extensive, high-quality facilities: multiple kids' clubs, professional childcare, playgrounds, water parks, family-focused entertainment.
    *   **4**: Very good facilities: reliable kids' clubs, playgrounds, and child-friendly restaurants.
    *   **3**: Good basic amenities: some hotels have kids' clubs, high chairs are common.
    *   **2**: Limited options for young children.
    *   **1**: Very few or no kid-specific facilities.

### 3.4. Accommodation Data
*   `high_star_share` (decimal): The percentage of hotels rated 4 or 5 stars. Calculate this by searching on a major booking site (like Booking.com or TripAdvisor), filtering for the destination, and dividing the count of 4-star and 5-star hotels by the total number of hotels listed. Express as a percentage value (e.g., `72.50`).
*   `budget_level` (string): The overall cost profile of the destination. Must be one of: `'Budget'`, `'Mid-Range'`, `'Luxury'`. Base this on hotel prices, restaurant costs, and general travel guides.

### 3.5. Monthly Climate Data
*   `climate_data` (array of objects): An array containing exactly 12 objects, one for each month.
    *   `month` (integer): The month number (1 for January, 12 for December).
    *   `temperature_high` (integer): The average daytime high temperature in degrees Celsius (°C).
    *   `temperature_low` (integer): The average nighttime low temperature in degrees Celsius (°C).
    *   `rainfall_mm` (integer): The average monthly rainfall in millimeters (mm).

### 3.6. Data Sourcing
*   `data_sources` (array of strings): A list of the primary URLs you used to verify the data for the destination. Include at least two sources.

---

## 4. BATCH PROCESSING & DESTINATION PRIORITIES

You will be given a list of 20-50 destinations to process in each batch. Focus your research on the following types of destinations to ensure a balanced and desirable database expansion.

### 4.1. Destination Types to Prioritize
1.  **Popular Family Beach Destinations**: Well-known, safe, and easy beach holidays.
2.  **European City Breaks**: Cities within a 2-4 hour flight from the UK, suitable for short family trips.
3.  **Long-Haul Beach Resorts**: Iconic luxury destinations (e.g., Maldives, Caribbean, Southeast Asia).
4.  **Cultural/Adventure (Family-Friendly)**: Locations offering unique but safe experiences for families.
5.  **Up-and-Coming Destinations**: Less-touristy but increasingly popular family spots.

### 4.2. Geographic Coverage to Expand
*   **Europe**: More Greek Islands (e.g., Crete, Rhodes), Croatia (e.g., Dubrovnik, Split), Portugal (e.g., Algarve coast).
*   **Caribbean**: More islands (e.g., Barbados, St. Lucia, Antigua).
*   **Southeast Asia**: Islands in Thailand, Malaysia, and Indonesia.
*   **Middle East**: Family-oriented resorts in UAE, Oman, Qatar.
*   **North America**: Key family spots in Florida, California, Hawaii, and Mexico (e.g., Cancun, Riviera Maya).
*   **Indian Ocean**: Maldives, Mauritius, Seychelles.

---

## 5. STRUCTURED OUTPUT FORMAT (JSON)

Return your findings in a single JSON object. The root object should have a key named `"destinations"` which is an array of the destination objects you researched. Adhere strictly to this format.

**Example JSON Structure**:
```json
{
  "destinations": [
    {
      "name": "Destination Name",
      "country": "Country Name",
      "region": "Geographic Region",
      "flight_hours": 8.5,
      "time_difference": -5,
      "beach_pool_quality": 4,
      "kid_facilities_quality": 3,
      "high_star_share": 65.20,
      "budget_level": "Mid-Range",
      "climate_data": [
        {"month": 1, "temperature_high": 28, "temperature_low": 21, "rainfall_mm": 45},
        {"month": 2, "temperature_high": 28, "temperature_low": 21, "rainfall_mm": 35},
        {"month": 3, "temperature_high": 29, "temperature_low": 22, "rainfall_mm": 30},
        {"month": 4, "temperature_high": 30, "temperature_low": 23, "rainfall_mm": 40},
        {"month": 5, "temperature_high": 31, "temperature_low": 24, "rainfall_mm": 90},
        {"month": 6, "temperature_high": 31, "temperature_low": 25, "rainfall_mm": 150},
        {"month": 7, "temperature_high": 31, "temperature_low": 25, "rainfall_mm": 160},
        {"month": 8, "temperature_high": 31, "temperature_low": 25, "rainfall_mm": 180},
        {"month": 9, "temperature_high": 30, "temperature_low": 24, "rainfall_mm": 200},
        {"month": 10, "temperature_high": 29, "temperature_low": 23, "rainfall_mm": 150},
        {"month": 11, "temperature_high": 29, "temperature_low": 22, "rainfall_mm": 80},
        {"month": 12, "temperature_high": 28, "temperature_low": 21, "rainfall_mm": 60}
      ],
      "data_sources": [
        "https://www.example-tourism-board.com/",
        "https://www.weatheronline.co.uk/destination/climate.htm",
        "https://www.tripadvisor.com/destination-reviews"
      ]
    }
  ]
}
```

---

## 6. WORKING EXAMPLE & YOUR FIRST BATCH

To ensure you understand the task, here is a complete, researched example for three destinations.

### Fully Researched Example

```json
{
  "destinations": [
    {
      "name": "Santorini",
      "country": "Greece",
      "region": "Europe",
      "flight_hours": 4.0,
      "time_difference": 2,
      "beach_pool_quality": 4,
      "kid_facilities_quality": 3,
      "high_star_share": 72.50,
      "budget_level": "Luxury",
      "climate_data": [
        {"month": 1, "temperature_high": 14, "temperature_low": 9, "rainfall_mm": 71},
        {"month": 2, "temperature_high": 14, "temperature_low": 9, "rainfall_mm": 55},
        {"month": 3, "temperature_high": 16, "temperature_low": 11, "rainfall_mm": 45},
        {"month": 4, "temperature_high": 19, "temperature_low": 13, "rainfall_mm": 22},
        {"month": 5, "temperature_high": 23, "temperature_low": 17, "rainfall_mm": 12},
        {"month": 6, "temperature_high": 27, "temperature_low": 21, "rainfall_mm": 2},
        {"month": 7, "temperature_high": 29, "temperature_low": 23, "rainfall_mm": 1},
        {"month": 8, "temperature_high": 29, "temperature_low": 23, "rainfall_mm": 1},
        {"month": 9, "temperature_high": 26, "temperature_low": 21, "rainfall_mm": 10},
        {"month": 10, "temperature_high": 22, "temperature_low": 17, "rainfall_mm": 38},
        {"month": 11, "temperature_high": 18, "temperature_low": 14, "rainfall_mm": 58},
        {"month": 12, "temperature_high": 15, "temperature_low": 11, "rainfall_mm": 75}
      ],
      "data_sources": [
        "https://www.weatheronline.co.uk/Greece/Santorini.htm",
        "https://www.skyscanner.net/flights-to/jtr/airlines-that-fly-to-santorini-thira-airport.html",
        "https://www.tripadvisor.co.uk/Hotels-g189433-Santorini_Cyclades_South_Aegean-Hotels.html"
      ]
    },
    {
      "name": "Algarve",
      "country": "Portugal",
      "region": "Europe",
      "flight_hours": 2.75,
      "time_difference": 0,
      "beach_pool_quality": 5,
      "kid_facilities_quality": 4,
      "high_star_share": 45.80,
      "budget_level": "Mid-Range",
      "climate_data": [
        {"month": 1, "temperature_high": 16, "temperature_low": 8, "rainfall_mm": 78},
        {"month": 2, "temperature_high": 17, "temperature_low": 9, "rainfall_mm": 72},
        {"month": 3, "temperature_high": 19, "temperature_low": 10, "rainfall_mm": 39},
        {"month": 4, "temperature_high": 20, "temperature_low": 12, "rainfall_mm": 38},
        {"month": 5, "temperature_high": 23, "temperature_low": 14, "rainfall_mm": 21},
        {"month": 6, "temperature_high": 26, "temperature_low": 17, "rainfall_mm": 8},
        {"month": 7, "temperature_high": 29, "temperature_low": 19, "rainfall_mm": 1},
        {"month": 8, "temperature_high": 29, "temperature_low": 19, "rainfall_mm": 4},
        {"month": 9, "temperature_high": 26, "temperature_low": 18, "rainfall_mm": 22},
        {"month": 10, "temperature_high": 23, "temperature_low": 15, "rainfall_mm": 67},
        {"month": 11, "temperature_high": 19, "temperature_low": 11, "rainfall_mm": 86},
        {"month": 12, "temperature_high": 17, "temperature_low": 9, "rainfall_mm": 94}
      ],
      "data_sources": [
        "https://www.weather.com/en-GB/weather/today/l/POXX0004:1:PO",
        "https://www.kayak.co.uk/flights/London-Faro-FAO",
        "https://www.booking.com/region/pt/algarve.html"
      ]
    },
    {
      "name": "Barbados",
      "country": "Barbados",
      "region": "Caribbean",
      "flight_hours": 8.75,
      "time_difference": -4,
      "beach_pool_quality": 5,
      "kid_facilities_quality": 4,
      "high_star_share": 55.00,
      "budget_level": "Luxury",
      "climate_data": [
        {"month": 1, "temperature_high": 28, "temperature_low": 23, "rainfall_mm": 66},
        {"month": 2, "temperature_high": 28, "temperature_low": 23, "rainfall_mm": 46},
        {"month": 3, "temperature_high": 29, "temperature_low": 23, "rainfall_mm": 38},
        {"month": 4, "temperature_high": 30, "temperature_low": 24, "rainfall_mm": 48},
        {"month": 5, "temperature_high": 30, "temperature_low": 25, "rainfall_mm": 79},
        {"month": 6, "temperature_high": 30, "temperature_low": 25, "rainfall_mm": 119},
        {"month": 7, "temperature_high": 30, "temperature_low": 25, "rainfall_mm": 150},
        {"month": 8, "temperature_high": 31, "temperature_low": 25, "rainfall_mm": 155},
        {"month": 9, "temperature_high": 30, "temperature_low": 25, "rainfall_mm": 173},
        {"month": 10, "temperature_high": 30, "temperature_low": 24, "rainfall_mm": 180},
        {"month": 11, "temperature_high": 29, "temperature_low": 24, "rainfall_mm": 178},
        {"month": 12, "temperature_high": 29, "temperature_low": 23, "rainfall_mm": 112}
      ],
      "data_sources": [
        "https://www.worldweatheronline.com/barbados-weather/bb.aspx",
        "https://www.skyscanner.net/flights-to/bgi/flights-to-bridgetown-airport.html",
        "https://www.tripadvisor.com/Hotels-g147262-Barbados-Hotels.html"
      ]
    }
  ]
}
```

### Your First Research Batch

Now, proceed by researching the following **20 destinations**. Provide the output in the single, valid JSON format as specified above.

1.  Crete, Greece
2.  Rhodes, Greece
3.  Dubrovnik, Croatia
4.  Split, Croatia
5.  St. Lucia
6.  Antigua
7.  Phuket, Thailand
8.  Langkawi, Malaysia
9.  Bali, Indonesia
10. Dubai, UAE
11. Muscat, Oman
12. Orlando, Florida, USA
13. San Diego, California, USA
14. Maui, Hawaii, USA
15. Cancun, Mexico
16. Male, Maldives
17. Mauritius
18. Seychelles
19. Majorca, Spain
20. Tenerife, Spain
