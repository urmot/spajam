# -*- coding: utf-8 -*-
import numpy as np
from sklearn.naive_bayes import GaussianNB # ガウシアン

X = np.array([[36.8,5,71],
              [38.6,2,90],
              [39.0,9,80]]) # 特徴ベクトル
y = np.array([1, 0, 0]) # そのラベル
t = np.array([[38.0,0,80]]) # テストデータ

clf = GaussianNB() # 正規分布を仮定したベイズ分類
clf.fit(X, y) # 学習をする
result = clf.predict(t) # => [3]
print(result)