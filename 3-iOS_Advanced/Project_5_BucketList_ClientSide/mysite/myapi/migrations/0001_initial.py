# Generated by Django 3.1.5 on 2021-07-12 21:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('objective', models.CharField(max_length=200)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
