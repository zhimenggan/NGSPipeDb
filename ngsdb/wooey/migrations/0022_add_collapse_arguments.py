# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-08 12:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wooey', '0021_fix_verbose_names'),
    ]

    operations = [
        migrations.AddField(
            model_name='scriptparameter',
            name='collapse_arguments',
            field=models.BooleanField(default=True, help_text='Collapse separate inputs to a given argument to a single input (ie: --arg 1 --arg 2 becomes --arg 1 2)'),
        ),
    ]
