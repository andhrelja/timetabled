# Generated by Django 3.1.3 on 2021-01-30 17:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('departments', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='department',
            name='address',
            field=models.CharField(max_length=254, verbose_name='Adresa'),
        ),
    ]
