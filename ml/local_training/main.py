# -*- coding: utf-8 -*-
import numpy as np
from sklearn.naive_bayes import GaussianNB # ガウシアン
import pickle

X = np.array([[36.8,5,71],
              [38.6,2,90],
              [39.0,9,80]]) # 特徴ベクトル
y = np.array([1, 0, 0]) # そのラベル

clf = GaussianNB() # 正規分布を仮定したベイズ分類
clf.fit(X, y) # 学習をする
filename = '../health_prediction/predict_model/online_naive_bayes_model.sav'

pickle.dump(clf, open(filename, 'wb'))
# result = clf.predict(t) # => [3]
# print(result)