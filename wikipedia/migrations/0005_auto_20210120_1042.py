# Generated by Django 3.1.5 on 2021-01-20 05:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wikipedia', '0004_auto_20210120_1031'),
    ]

    operations = [
        migrations.CreateModel(
            name='regi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=20)),
                ('lname', models.CharField(max_length=20)),
                ('email', models.EmailField(max_length=254)),
                ('password', models.CharField(max_length=6)),
                ('address', models.CharField(max_length=50)),
                ('city', models.CharField(max_length=20)),
                ('state', models.CharField(max_length=20)),
                ('zipcode', models.IntegerField()),
            ],
        ),
        migrations.DeleteModel(
            name='registration',
        ),
    ]
