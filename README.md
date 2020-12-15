<p align="center">
	<a href="" rel="noopener">
	<img width=200px height=200px src="src/static/images/timetabled_logo.png" alt="Project logo"></a>
</p>


<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/andhrelja/notraction.svg)](https://github.com/andhrelja/notraction/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/andhrelja/notraction.svg)](https://github.com/andhrelja/notraction/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Few lines describing your project.
    <br> 
</p>

## O projektu

Your project’s name is the first thing people will see upon scrolling
down to your README, and is included upon creation of your README file.


## Tablica sadržaja

Optionally, include a table of contents in order to allow other people
to quickly navigate especially long or detailed READMEs.


## Instalacija

Kloniranjem se pokreće download repozitorija u direktorij iz kojeg je zadana `git clone` komanda. 
  
```
  $ git clone https://github.com/andhrelja/timetabled
  $ pip install -r requirements.txt && cd src/ 
  # python manage.py runserver
```

Provjeru uspješne instalacije moguće je obaviti pokretanjem `requirements_check.py` Python skripte u root folderu repozitorija.

Ovako pokrenuti lokalni server, bez izmjena u `src/timetabled/settings.py` datoteci, spojen je na Heroku bazu s informacijama o konekciji dostupnima u `src/settings.py` datoteci unutar sekcije `# Database`.

Tamo su dostupne dvije konfiguracije. Konfiguracija s `HOST` postavljenim na `localhost` pokazuje na lokalnu bazu koju je potrebno stvoriti manualno instalacijom [PostgreSQL baze](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) (verzija 12.5) na lokalno računalo. 

Dodatak instalaciji je DBMS alat pgAdmin dostupan na [službenim stranicama](https://www.pgadmin.org/download/pgadmin-4-windows/) (najnovija verzija), a može se koristiti bilo koji drugi DBMS alat ([Dbeaver](https://dbeaver.io/download/), [MySQL Workbench](https://dev.mysql.com/downloads/workbench/), [phpMyAdmin](https://www.phpmyadmin.net/downloads/), ...).

## Usage

The next section is usage, in which you instruct other people on how to use your project after they’ve installed it. This would also be a good
place to include screenshots of your project in action.

## Contributing

Larger projects often have sections on contributing to their project, in which contribution instructions are outlined. Sometimes, this is a separate file. If you have specific contribution preferences, explain them so that other developers know how to best contribute to your work. To learn more about how to help others contribute, check out the guide
for setting guidelines for repository contributors.

## Credits

Include a section for credits in order to highlight and link to the
authors of your project.

## License

Finally, include a section for the license of your project. For more information on choosing a license, check out GitHub’s licensing guide!

Your README should contain only the necessary information for developers to get started using and contributing to your project. Longer documentation is best suited for wikis, outlined below.
