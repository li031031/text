from flask import Flask, render_template,request,url_for,redirect
app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")

def insert_data(username, password, email):
    import pymysql
    try:
        connectiont = pymysql.connect(
            host='localhost',
            user='root',
            password='',
            db='text_01',
            charset='utf8',
            cursorclass=pymysql.cursors.DictCursor
        )
        cursor = connectiont.cursor()
        data = [(username, password, email)]
        cursor.executemany("INSERT INTO user_table (username, password, email) VALUES (%s, %s, %s)", data)
        connectiont.commit()
    except pymysql.Error as e:
        print(f"Error: {e}")
        connectiont.rollback()
    finally:
        cursor.close()
        connectiont.close()

@app.route('/register', methods=['GET','POST'])
def register():

    if (request.method == "POST"):
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        print(username)
        print(password)
        print(email)

        insert_data(username, password, email)
        # return render_template("index.html")
        # return redirect("/")
        return redirect(url_for('index'))
    else:
        return render_template("register.html")


if __name__ == '__main__':
    app.run(debug=True)