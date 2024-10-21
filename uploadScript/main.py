import firebase_admin
import json

from firebase_admin import credentials, firestore

cred = credentials.Certificate('/Users/sebastian/PrivateKey/travel-3c0d3-firebase-adminsdk-mid2r-7c76af12f1.json')
firebase_admin.initialize_app(cred)

# Initialize Firestore
db = firestore.client()

# Load the JSON data
with open('countries+states+cities.json', 'r') as file:
    data = json.load(file)


def upload_data_to_firestore(countrydata):
    for country in countrydata:
        # Create a document for the country
        country_ref = db.collection('countries-database').document(str(country['id']))
        country_data = {
            'name': country['name'],
            'iso3': country.get('iso3'),
            'iso2': country.get('iso2'),
            'capital': country.get('capital'),
            'region': country.get('region'),
            'currency': country.get('currency'),
            'numeric_code': country.get('numeric_code'),
            'phone_code': country.get('phone_code'),
            'currency_name': country.get('currency_name'),
            'currency_symbol': country.get('currency_symbol'),
            'tld': country.get('tld'),
            'native': country.get('native'),
            'latitude': country.get('latitude'),
            'longitude': country.get('longitude'),
            'emoji': country.get('emoji'),
            'nationality': country.get('nationality'),
        }
        country_ref.set(country_data)

        # Upload states for the country
        if 'states' in country:
            for state in country['states']:
                state_ref = country_ref.collection('states').document(str(state['id']))
                state_data = {
                    'name': state['name'],
                    'latitude': state.get('latitude'),
                    'longitude': state.get('longitude'),
                    'state_code': state.get('state_code'),
                    'type': state.get('type'),
                }
                state_ref.set(state_data)

                # Upload cities for the state
                if 'cities' in state:
                    for city in state['cities']:
                        city_ref = state_ref.collection('cities').document(str(city['id']))
                        city_data = {
                            'name': city['name'],
                            'latitude': city.get('latitude'),
                            'longitude': city.get('longitude'),
                        }
                        city_ref.set(city_data)


# Call the function to upload data
upload_data_to_firestore(data)
