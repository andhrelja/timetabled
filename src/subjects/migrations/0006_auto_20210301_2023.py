# Generated by Django 3.1.3 on 2021-03-01 19:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subjects', '0005_auto_20210301_1821'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subjectprograms',
            name='semester',
            field=models.CharField(choices=[('1', '1. semestar'), ('2', '2. semestar'), ('3', '3. semestar'), ('4', '4. semestar'), ('5', '5. semestar'), ('6', '6. semestar')], max_length=1, null=True, verbose_name='Semestar'),
        ),
    ]
