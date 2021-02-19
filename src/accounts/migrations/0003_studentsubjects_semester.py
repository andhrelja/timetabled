# Generated by Django 3.1.3 on 2021-02-19 18:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_auto_20201224_0157'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentsubjects',
            name='semester',
            field=models.CharField(choices=[('1', '1. semester'), ('2', '2. semester'), ('3', '3. semester'), ('4', '4. semester'), ('5', '5. semester'), ('6', '6. semester')], max_length=1, null=True, verbose_name='Semestar'),
        ),
    ]
