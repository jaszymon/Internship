import os 
import sys
#pliki = os.listdir('.')
#for plik in pliki:
#    if plik.endswith(".json"):
#        nazwa,rozszerzenie=os.path.splitext(plik)
#        print("Znalazlem {}{}".format(nazwa,rozszerzenie))             
import json
dane = {
  "ConnectionStrings": {
       "ConnectionString": [{
           "DataSource": "dejtasors",
           "UID": "ID",
           "PWD": "PA$$",
           "DATABASE": "Nazwa"
       },
           {
           "DataSource": "inny_dejtasors",
           "UID": "inne_ID",
           "PWD": "inny_PA$$",
           "DATABASE": "inna_Nazwa"   
       }]
   },
    "Imie": "Jan",
    "Nazwisko":"Kowalski",
    "Wiek":"25",
    "folders": [
        {"folder": "Private Folder 1"},
          {"folder": "Private Folder 2"}
      ]
}
if len(sys.argv) > 1:
        with open((sys.argv[1]), 'w') as json_file:
                json.dump(dane, json_file)
with open('KonekszynStringi.json', 'w') as json_file:
        json.dump(dane, json_file)
    
with open("{}{}".format(nazwa,rozszerzenie)) as json_file:
    data=json.load(json_file)
    print (data['ConnectionStrings']['ConnectionString'])
    print ("Odstep :)")
    print (data['ConnectionStrings'])