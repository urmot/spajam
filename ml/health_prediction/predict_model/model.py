import pickle
import numpy as np

clf = pickle.load(open('./online_naive_bayes_model.sav', 'rb'))


def predict(request):
    # request
    print("fugagu")
    t = np.array([[38.0, 0, 80]])  # テストデータ
    result = clf.predict(t)  # => [3]
    print(result)
    print("test")
    return "{}%".format(result[0])
