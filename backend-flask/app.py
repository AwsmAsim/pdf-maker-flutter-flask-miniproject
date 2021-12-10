from flask import Flask, request, jsonify, send_file
from PIL import Image
from PyPDF2 import PdfFileMerger
from werkzeug.serving import WSGIRequestHandler
import os

app = Flask(__name__)
merger = PdfFileMerger()

@app.route('/')
def home_page():
    return 'App is running'


@app.route('/api', methods=['POST', 'GET'])
def test():
    global file_to_be_returned
    if request.method == 'POST':
        file_name = request.form['file_name']
        print(file_name)
        images = request.files.getlist("imagefile")
        print(images)
        file_to_be_returned = convert_jpg_to_pdf(images[0])
        fileNumber = 0
        for image in images:
            converted_pdf = convert_jpg_to_pdf(image)
            os.remove(image)
            merger.append(converted_pdf)
            print(fileNumber)
            fileNumber = fileNumber + 1
        merger.write(file_name+'.pdf')
        file_to_be_returned = file_name+'.pdf'
        print(type(send_file(file_to_be_returned)))
        # return send_file(file_to_be_returned)

        return file_to_be_returned
    if request.method == 'GET':
        d = {'status': 'Active'}
        print('file to be returned = {}'.format(file_to_be_returned))

        return send_file(file_to_be_returned)


def convert_jpg_to_pdf(file):
    print(file.filename)
    print('Inside the convert jpf to pdf')
    pdf = Image.open(file)
    fileNameComponents = file.filename.split('.')
    save_location = fileNameComponents[0] + '.pdf'
    pdf.save(fp=save_location)
    return save_location


if __name__ == '__main__':
    WSGIRequestHandler.protocol_version = "HTTP/1.1"
    app.run()
