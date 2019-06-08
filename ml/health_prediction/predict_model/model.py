import pickle
import numpy as np
import os

def predict(request):
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, './online_naive_bayes_model.sav')
    clf = pickle.load(open(filename, 'rb'))
    # request
    print("fugagu")
    t = np.array([[38.0, 0, 80]])  # テストデータ
    result = clf.predict(t)  # => [3]
    print(result)
    print("test")
    return "{}%".format(result[0])

if(__name__ == '__main__'):
    predict('')
