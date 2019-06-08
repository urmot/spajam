import pickle
import numpy as np
import os


def predict(request):
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, './online_naive_bayes_model.sav')
    clf = pickle.load(open(filename, 'rb'))
    print(request)
    t = np.array(
        [
            [request['bodyTemperature'], request['sleepAnalysis'], request['heartRate']]
        ]
    )  # テストデータ
    result = clf.predict(t)  # => [3]
    return {
        "id": "attend",
        "predict": result[0],
        "score": clf.score(t, 1)[0],
        "percentage": clf.score(t, 1)[0] * 100
    }


if(__name__ == '__main__'):
    predict('')
