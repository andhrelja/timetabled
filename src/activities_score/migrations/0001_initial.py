# Generated by Django 3.1.3 on 2020-12-13 18:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('subjects', '0001_initial'),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GlobalScoreActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, verbose_name='Naziv')),
                ('location', models.CharField(max_length=128, verbose_name='Prostor')),
                ('type', models.IntegerField(choices=[(0, 'Kolokvij'), (1, 'Seminar'), (2, 'Esej'), (3, 'Prezentacija'), (4, 'Domaća zadaća'), (5, 'Laboratorijske vježbe'), (6, 'Završni ispit'), (7, 'Projekt'), (8, 'Rasprava'), (9, 'Timski rad'), (10, 'Ostalo')], verbose_name='Tip aktivnosti')),
                ('details', models.TextField(null=True, verbose_name='Dodatne informacije')),
                ('points_accomplished', models.FloatField(default=0, verbose_name='Ostvareni bodovi')),
                ('points_total', models.FloatField(default=0, verbose_name='Moguće ostvarivi bodovi')),
                ('due_date', models.DateField(verbose_name='Datum')),
                ('start_time', models.TimeField(verbose_name='Vrijeme početka')),
                ('end_time', models.TimeField(verbose_name='Vrijeme završetka')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='subjects.subject', verbose_name='Kolegij')),
            ],
            options={
                'verbose_name': 'Global - Bodovna aktivnost',
                'verbose_name_plural': 'Global - Bodovne aktivnosti',
            },
        ),
        migrations.CreateModel(
            name='StudentScoreActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, verbose_name='Naziv')),
                ('location', models.CharField(max_length=128, verbose_name='Prostor')),
                ('type', models.IntegerField(choices=[(0, 'Kolokvij'), (1, 'Seminar'), (2, 'Esej'), (3, 'Prezentacija'), (4, 'Domaća zadaća'), (5, 'Laboratorijske vježbe'), (6, 'Završni ispit'), (7, 'Projekt'), (8, 'Rasprava'), (9, 'Timski rad'), (10, 'Ostalo')], verbose_name='Tip aktivnosti')),
                ('details', models.TextField(null=True, verbose_name='Dodatne informacije')),
                ('points_accomplished', models.FloatField(default=0, verbose_name='Ostvareni bodovi')),
                ('points_total', models.FloatField(default=0, verbose_name='Moguće ostvarivi bodovi')),
                ('due_date', models.DateField(verbose_name='Datum')),
                ('start_time', models.TimeField(verbose_name='Vrijeme početka')),
                ('end_time', models.TimeField(verbose_name='Vrijeme završetka')),
                ('global_activity', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='global_score_activity', to='activities_score.globalscoreactivity', verbose_name='Bodovna aktivnost')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_score_activity', to='accounts.student', verbose_name='Student')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='subjects.subject', verbose_name='Kolegij')),
            ],
            options={
                'verbose_name': 'Global - Bodovna aktivnost',
                'verbose_name_plural': 'Global - Bodovne aktivnosti',
            },
        ),
    ]
