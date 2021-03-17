import os
from flask import Flask,Blueprint,request,render_template,jsonify,redirect

app = Flask(__name__)

uploads_dir = './uploads'

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        profile = request.files['images']
        profile.save(os.path.join(uploads_dir, profile.filename))
        print("Done")

    return


'''

@app.route('/upload',methods = ['POST'])
def hello_world():
    file = request.files['file']
    filename = "ThisFile"
    file.save(os.path.join(app.config['upload_folder'], filename))
'''
if __name__ == '__main__':
    app.run()