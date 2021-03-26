from tensorflow import keras as k
import os
import numpy as np
from cv2 import cv2


def make_prediction(filename):
    uploads_dir = os.path.join(r'D:\D_Apps\Cheat_Meal\flask',filename)
    model=k.models.load_model(r'model\CheetMealModel.h5')
    image = cv2.imread(uploads_dir)

    CATEGORIES = ['Apricot', 'Avocado','Banana', 'Blueberry', 'Cauliflower', 'Cocos', 'Eggplant', 'Hazelnut', 'Kiwi', 'Limes.' ]

    img = k.preprocessing.image.load_img(uploads_dir, target_size= (100,100))
    x = k.preprocessing.image.img_to_array(img)
    x=x/255
    x=x.reshape(1,100, 100,3)
    l = model.predict(x)
    preds_classes = np.argmax(l, axis=-1)
    return CATEGORIES[preds_classes[0]]