from flask import Flask, render_template
import random

app = Flask(__name__)

# List of images
images = [
    "https://media4.giphy.com/media/I62KiYQ009SHFLXpUx/giphy.gif?cid=ecf05e474i7wfqu50dx9lv92seiaak5tgvovxoyj3ly57gsi&rid=giphy.gif&ct=g",
    "https://media1.giphy.com/media/s3SE9MsgbeW3u/giphy.gif?cid=ecf05e4744cd53d8571338432f4506d3caab147b1c95b028&rid=giphy.gif&ct=g",
    "https://media2.giphy.com/media/GiWEowj3nQv9C/giphy.gif?cid=ecf05e47ondq4vulkvpoady8cp5vwt06nnrtp9haidkioca3&rid=giphy.gif&ct=g",
    "https://media2.giphy.com/media/jUwpNzg9IcyrK/giphy.gif?cid=ecf05e47r3jlkzvjthzxhrnthj7ba89orjaazizhiuktpuxl&rid=giphy.gif&ct=g",
    "https://media4.giphy.com/media/fUYhyT9IjftxrxJXcE/giphy.gif?cid=ecf05e47r3jlkzvjthzxhrnthj7ba89orjaazizhiuktpuxl&rid=giphy.gif&ct=g",
    "https://media1.giphy.com/media/3o6gDWzmAzrpi5DQU8/giphy.gif?cid=ecf05e474i7wfqu50dx9lv92seiaak5tgvovxoyj3ly57gsi&rid=giphy.gif&ct=g",
    "https://media1.giphy.com/media/3ndAvMC5LFPNMCzq7m/giphy.gif?cid=ecf05e474i7wfqu50dx9lv92seiaak5tgvovxoyj3ly57gsi&rid=giphy.gif&ct=g",
    "https://media0.giphy.com/media/jKaFXbKyZFja0/giphy.gif?cid=ecf05e47wkzby36tytyf0b4neduyjtasnu975tepic32nnl8&rid=giphy.gif&ct=g",
    "https://media0.giphy.com/media/byuWzpSHNk7EA/giphy.gif?cid=ecf05e47t51fn2f011tv4dmhg0ig2qygzn4fp3u2cjgwbgtu&rid=giphy.gif&ct=g",
    "https://media2.giphy.com/media/OPU6wzx8JrHna/giphy.gif?cid=ecf05e47ruhhsj8g9dv0bxwv3g71uwlwr28mqmyc88ue3jof&rid=giphy.gif&ct=g",
    "https://media2.giphy.com/media/lpHPFVpk65qpbH2XY5/giphy.gif?cid=ecf05e47g26j9lo44wxv932kshj1rmettw5bbmk4zg2bsxtz&rid=giphy.gif&ct=g",
    "https://media1.giphy.com/media/erwgRIFXjS0zC/giphy.gif?cid=ecf05e474328ov9jpb8vu2u17aw01lgk16z1k5u44insftr0&rid=giphy.gif&ct=g"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
