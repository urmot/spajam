# -*- coding: utf-8 -*-
import numpy as np
from sklearn.naive_bayes import GaussianNB  # ガウシアン
import pickle
from numpy.random import normal, randint

bodyTemperature = normal(35.5, 1.5, size=1000)
bodyTemperature[bodyTemperature < 34] = 34
bodyTemperature[bodyTemperature > 40] = 40
sleepAnalysis = normal(5, 2, size=1000)
sleepAnalysis[sleepAnalysis > 18] = 18
sleepAnalysis[sleepAnalysis < 0] = 0
heartRate = normal(60, 20, size=1000)
heartRate[heartRate > 180] = 180
heartRate[heartRate < 40] = 40
binary = np.repeat(0, 1000)
binary[
    ((35 < bodyTemperature) & (bodyTemperature < 38)) &
    (
        ((5 < sleepAnalysis) & (sleepAnalysis < 10)) |
        ((50 < heartRate) & (sleepAnalysis < 120))
    )
] = 1

X = np.array([
    bodyTemperature,
    sleepAnalysis,
    heartRate
]).T  # 特徴ベクトル

y = np.array(binary)  # そのラベル

clf = GaussianNB()  # 正規分布を仮定したベイズ分類
clf.fit(X, y)  # 学習をする
filename = '../health_prediction/predict_model/online_naive_bayes_model.sav'

pickle.dump(clf, open(filename, 'wb'))
# result = clf.predict(t) # => [3]
# print(result)
