#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

Read data from unzipped file

"""
import pandas as pd
import matplotlib.pyplot as mat
import seaborn as sb

df = pd.read_csv('data/SHR76_16.csv')

"""

remove all unintentional homicides
remove all incidents with less than 4 victims

"""

mm = df[(df.Homicide == 'Murder and non-negligent manslaughter') & (df.VicCount > 3)]

cols = ['State','Weapon','Year','Month']

mm = mm[cols]

for col in cols:
    mm[col] = mm[col].astype('category')

sb.countplot(mm['Month'])

