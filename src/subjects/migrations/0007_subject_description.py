# Generated by Django 3.1.3 on 2021-10-04 17:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subjects', '0006_auto_20210301_2023'),
    ]

    operations = [
        migrations.AddField(
            model_name='subject',
            name='description',
            field=models.TextField(default='', verbose_name='Opis'),
            preserve_default=False,
        ),
    ]
