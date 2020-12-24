# Generated by Django 3.1.3 on 2020-12-23 21:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activities_score', '0003_auto_20201217_1831'),
    ]

    operations = [
        migrations.AlterField(
            model_name='globalscoreactivity',
            name='type',
            field=models.IntegerField(choices=[(0, 'Kolokvij'), (1, 'Seminar'), (2, 'Esej'), (3, 'Prezentacija'), (4, 'Domaća zadaća'), (5, 'Laboratorijske vježbe'), (6, 'Završni ispit'), (7, 'Projekt'), (8, 'Rasprava'), (9, 'Timski rad'), (10, 'Kviz'), (11, 'Ostalo')], verbose_name='Tip aktivnosti'),
        ),
        migrations.AlterField(
            model_name='studentscoreactivity',
            name='type',
            field=models.IntegerField(choices=[(0, 'Kolokvij'), (1, 'Seminar'), (2, 'Esej'), (3, 'Prezentacija'), (4, 'Domaća zadaća'), (5, 'Laboratorijske vježbe'), (6, 'Završni ispit'), (7, 'Projekt'), (8, 'Rasprava'), (9, 'Timski rad'), (10, 'Kviz'), (11, 'Ostalo')], verbose_name='Tip aktivnosti'),
        ),
    ]
