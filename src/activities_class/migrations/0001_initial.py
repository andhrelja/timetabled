# Generated by Django 3.1.3 on 2020-12-05 21:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('subjects', '0002_auto_20201205_2018'),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GlobalClassActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, verbose_name='Naziv')),
                ('location', models.CharField(max_length=128, verbose_name='Prostor')),
                ('type', models.IntegerField(choices=[(0, 'Predavanja'), (1, 'Vježbe'), (2, 'Predavanja i vježbe'), (3, 'Ostalo')], verbose_name='Tip aktivnosti')),
                ('details', models.TextField(null=True, verbose_name='Dodatne informacije')),
                ('date', models.DateField(verbose_name='Datum')),
                ('start_time', models.TimeField(verbose_name='Vrijeme početka')),
                ('end_time', models.TimeField(verbose_name='Vrijeme završetka')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='subjects.subject', verbose_name='Kolegij')),
            ],
            options={
                'verbose_name': 'Global - Nebodovna aktivnost',
                'verbose_name_plural': 'Global - Nebodovne aktivnosti',
            },
        ),
        migrations.CreateModel(
            name='StudentClassActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, verbose_name='Naziv')),
                ('location', models.CharField(max_length=128, verbose_name='Prostor')),
                ('type', models.IntegerField(choices=[(0, 'Predavanja'), (1, 'Vježbe'), (2, 'Predavanja i vježbe'), (3, 'Ostalo')], verbose_name='Tip aktivnosti')),
                ('details', models.TextField(null=True, verbose_name='Dodatne informacije')),
                ('date', models.DateField(verbose_name='Datum')),
                ('start_time', models.TimeField(verbose_name='Vrijeme početka')),
                ('end_time', models.TimeField(verbose_name='Vrijeme završetka')),
                ('global_activity', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='global_class_activity', to='activities_class.globalclassactivity', verbose_name='Nebodovna aktivnost')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_class_activity', to='accounts.student', verbose_name='Student')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='subjects.subject', verbose_name='Kolegij')),
            ],
            options={
                'verbose_name': 'Student - Nebodovna aktivnost',
                'verbose_name_plural': 'Student - Nebodovne aktivnosti',
            },
        ),
    ]
