# Generated by Django 4.2.2 on 2023-06-22 20:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0016_programme_publich"),
    ]

    operations = [
        migrations.AddField(
            model_name="semaine",
            name="publich",
            field=models.BooleanField(default=False),
        ),
    ]
