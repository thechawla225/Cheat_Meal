import os
from flask import Flask,Blueprint,request,render_template,jsonify,redirect
from predict import make_prediction
import json

app = Flask(__name__)

uploads_dir = r'D:\D_Apps\Cheat_Meal\flask'
answer = {'prediciton':'Cauliflower'}

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        profile = request.files['images']
        profile.save(os.path.join(uploads_dir, profile.filename))
        print("Image saved to the folder")
        print("The filename is ",profile.filename)
        prediction = make_prediction(profile.filename)
        answer['prediction'] = prediction
        print("prediction made")
    return "500"
        

@app.route('/find', methods=['GET'])
def find():
    print("getting request")
    return jsonify(answer)
    
if __name__ == '__main__':
    app.run()






'''

@app.route('/upload',methods = ['POST'])
def hello_world():
    file = request.files['file']
    filename = "ThisFile"
    file.save(os.path.join(app.config['upload_folder'], filename))
'''