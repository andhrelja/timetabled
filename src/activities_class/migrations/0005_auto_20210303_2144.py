# Generated by Django 3.1.3 on 2021-03-03 20:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activities_class', '0004_auto_20210117_1702'),
    ]

    operations = [
        migrations.AddField(
            model_name='globalclassactivity',
            name='active',
            field=models.BooleanField(null=True, verbose_name='Aktivan'),
        ),
        migrations.AddField(
            model_name='studentclassactivity',
            name='active',
            field=models.BooleanField(null=True, verbose_name='Aktivan'),
        ),
    ]
