# -*- coding: utf-8 -*-
import numpy as np
from sklearn.naive_bayes import GaussianNB  # ガウシアン
import pickle
from numpy.random import normal, randint

bodyTemperature = normal(35.5, 3, size=1000)   # 平均35、標準偏差3の正規分布
sleepAnalysy = normal(5, 2, size=1000)   # 平均35、標準偏差3の正規分布
heartRate = normal(60, 20, size=1000)   # 平均35、標準偏差3の正規分布
binary = randint(2, size=1000)   # 平均35、標準偏差3の正規分布

X = np.array([
    bodyTemperature,
    sleepAnalysy,
    heartRate
]).T  # 特徴ベクトル

y = np.array(binary)  # そのラベル

clf = GaussianNB()  # 正規分布を仮定したベイズ分類
clf.fit(X, y)  # 学習をする
filename = '../health_prediction/predict_model/online_naive_bayes_model.sav'

pickle.dump(clf, open(filename, 'wb'))
# result = clf.predict(t) # => [3]
# print(result)
