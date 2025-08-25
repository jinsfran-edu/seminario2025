import os
import pyodbc
import requests, uuid, json
from dotenv import load_dotenv

load_dotenv()
key = os.getenv("API_KEY")
location = os.getenv("Location")
server = os.getenv("Server")
database = os.getenv("Database")
user = os.getenv("User")
password = os.getenv("Password")

endpoint = "https://api.cognitive.microsofttranslator.com"
path = '/translate'
constructed_url = endpoint + path
params = {
    'api-version': '3.0',
    'from': 'en',
    'to': 'es'
}
headers = {
    'Ocp-Apim-Subscription-Key': key,
    'Ocp-Apim-Subscription-Region': location,
    'Content-type': 'application/json',
    'X-ClientTraceId': str(uuid.uuid4())
}

# Conexion a la base de datos
conn = pyodbc.connect('Driver={SQL Server};'
                       'Server=' + server + ';'
                       'Database=' + database + ';'
                       'UID=' + user + ';'
                       'PWD=' + password + ';')

cursor = conn.cursor()
cursor.execute('SELECT id_puesto, puesto, puesto_es FROM puesto_descr')
# Se obtienen los datos de la consulta y se traducen
translations = []
for row in cursor:
    body = [{ 'text': row[1]}]
    request = requests.post(constructed_url, params=params, headers=headers, json=body)
    response = request.json()
    translated_text = response[0]['translations'][0]['text']
    translations.append((translated_text, row[0]))

for translation in translations:
    cursor.execute("UPDATE puesto_descr SET puesto_es = ? WHERE id_puesto = ?", translation[0], translation[1])
conn.commit()
conn.close()

