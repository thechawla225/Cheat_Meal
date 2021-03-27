from predict import make_prediction

answer = {}
prediction = make_prediction('image_picker8338892262053686856.jpg')
answer['prediction'] = prediction
print(answer)