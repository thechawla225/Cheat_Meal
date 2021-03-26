import os
from flask import Flask,Blueprint,request,render_template,jsonify,redirect
from predict import make_prediction
import json

app = Flask(__name__)

uploads_dir = r'D:\D_Apps\Cheat_Meal\flask'

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        profile = request.files['images']
        profile.save(os.path.join(uploads_dir, profile.filename))
        print("Image saved to the folder")
        prediction = make_prediction(profile.filename)
        answer = {'prediction' : prediction}
        answer = json.dumps(answer)
    return answer

if __name__ == '__main__':
    app.run()






'''

@app.route('/upload',methods = ['POST'])
def hello_world():
    file = request.files['file']
    filename = "ThisFile"
    file.save(os.path.join(app.config['upload_folder'], filename))
'''