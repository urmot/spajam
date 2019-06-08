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
    predict_rate = clf.predict_proba(t)
    print(predict_rate)
    return {
        "id": "attend",
        "predict": int(result[0]),
        "score": float(predict_rate[0][0]),
        "percentage": float(predict_rate[0][0] * 100)
    }


if(__name__ == '__main__'):
    predict('')
