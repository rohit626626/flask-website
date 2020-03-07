from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
from datetime import datetime


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_TLS = False,
    MAIL_USE_SSL =True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password']
)
mail = Mail(app)


if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']

else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db =SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True) 
    name = db.Column(db.String(20),nullable=True) 
    phone_num = db.Column(db.Integer) 
    msg = db.Column(db.String(12),nullable=True)
    date = db.Column(db.String(12),nullable=True) 
    email = db.Column(db.String(200),nullable=True) 
 
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True) 
    title = db.Column(db.String(20),nullable=True) 
    slug = db.Column(db.String(200),nullable=True) 
    content = db.Column(db.String(12),nullable=True)
    date = db.Column(db.String(12),nullable=True) 
    img_file = db.Column(db.String(12),nullable=True) 
 

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    return render_template("index.html", params = params, posts = posts)

    
@app.route("/post/<string:post_slug>", methods=["GET"])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html", params = params, post=post)
    
@app.route("/about")
def about():
    return render_template("about.html", params = params)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method== 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num=phone, msg=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + name,
        sender=email,
        recipients=[params['gmail_user']],
        body = message + "\n" + phone
        )
    return render_template("contact.html", params = params)

    
app.run(debug=True)

 