# Generated by Django 3.1.3 on 2020-12-13 18:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('departments', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='Naziv')),
                ('ects', models.IntegerField(verbose_name='ECTS bodovi')),
                ('professor', models.CharField(max_length=128, null=True, verbose_name='Profesor')),
                ('assistant', models.CharField(max_length=128, null=True, verbose_name='Asistent')),
                ('academic_year', models.IntegerField(choices=[(2020, '2020/2021'), (2019, '2019/2020')], verbose_name='Akademska godina')),
                ('semester', models.CharField(choices=[('1', '1. semester'), ('2', '2. semester'), ('3', '3. semester'), ('4', '4. semester'), ('5', '5. semester'), ('6', '6. semester')], max_length=1, verbose_name='Semestar')),
                ('code', models.CharField(max_length=14, verbose_name='Kod')),
                ('csv_file', models.CharField(max_length=254, null=True, verbose_name='DINP - CSV datoteka')),
            ],
            options={
                'verbose_name': 'Kolegij',
                'verbose_name_plural': 'Kolegiji',
            },
        ),
        migrations.CreateModel(
            name='SubjectPrograms',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('optional', models.BooleanField(verbose_name='Izborni kolegij')),
                ('program', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='departments.program', verbose_name='Program')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='subjects.subject', verbose_name='Kolegij')),
            ],
            options={
                'verbose_name': 'Programi po kolegiju',
                'verbose_name_plural': 'Programi po kolegijima',
            },
        ),
    ]
