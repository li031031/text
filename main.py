from flask import Flask,render_template, request,redirect,url_for,session,jsonify
from mysql_util import MysqlUtil
import random
import os
import pandas as pd

app = Flask(__name__)
app.secret_key = 'mrsoft12345678' # 设置秘钥

@app.route('/')
def index():


    db = MysqlUtil()
    sql = 'SELECT * FROM category'
    categorys = db.fetchall(sql)  # 获取多条记录

    db = MysqlUtil()
    sql = 'SELECT * FROM product_temp'
    products = db.fetchall(sql)  # 获取多条记录
    print(products)

    return render_template("index.html",products=products, categorys=categorys)

@app.route('/bashboard')
def bashboard():

    db = MysqlUtil()
    sql = 'SELECT * FROM category'
    categorys = db.fetchall(sql)  # 获取多条记录

    db = MysqlUtil()
    sql = 'SELECT * FROM product_temp'
    products_02 = db.fetchall(sql)  # 获取多条记录
    print(products_02)

    return render_template("product_board.html",products_02=products_02,categorys=categorys)


def allowed_file(filename):
    ALLOWED_EXTENSIONS = {'jpg', 'png','jpeg',"bmp"}
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/add_product',methods=['GET','POST'])
def add_product():
    db = MysqlUtil()
    sql = 'SELECT * FROM category'
    categorys = db.fetchall(sql)  # 获取多条记录
    print(categorys)
    if (request.method == "POST"):
        pname = request.form.get("pname")
        pDesc = request.form.get("pDesc")
        counts = request.form.get("counts")
        old_price = request.form.get("old_price")
        new_price = request.form.get("new_price")
        print(pname)
        print(pDesc)
        print(counts)
        print(old_price)
        print(new_price)

        file = request.files['file']
        if file.filename == '':
            return '没有选择文件', 400
        if file and allowed_file(file.filename):
            filename = file.filename
            file_name, file_ext = os.path.splitext(os.path.basename(filename))
            # print(file_name)
            print(file_ext)
            dir_name = "./static/images/"
            new_name = str(random.randint(1,10000)) + file_ext
            print(dir_name)
            images_path = os.path.join(dir_name, new_name)
            print(images_path)
            file.save(images_path)

        id = "%10d" % random.randint(0,1000000000)
        # images_path = "/static/product_test/2.jpg"
        db = MysqlUtil() # 实例化数据库操作类
        sql = "INSERT INTO product_temp(id,pname,old_price,new_price,counts,images,pDesc) \
               VALUES ('%s', '%s', '%s','%s','%s','%s','%s')" % (id,pname,old_price,new_price,counts,images_path,pDesc) # 插入数据的SQL语句
        db.insert(sql)
        return redirect(url_for('bashboard'))
    else:
        return render_template("add_product.html", categorys=categorys)


@app.route('/delete_product/<string:id>', methods=['POST'])
def delete_product(id):
    db = MysqlUtil() # 实例化数据库操作类
    sql = "DELETE FROM product_temp WHERE id = '%s'" % (id) # 执行删除笔记的SQL语句
    db.delete(sql) # 删除数据库
    return redirect(url_for('bashboard'))


@app.route('/register', methods=['GET','POST'])
def register():

    if (request.method == "POST"):
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        print(username)
        print(password)
        print(email)

        id = "%10d" % random.randint(0, 1000000000)
        db = MysqlUtil()
        sql = "INSERT INTO users(id,name,password,email) \
        VALUES ('%s', '%s', '%s','%s')" % (id,username,password,email) # 插入数据的SQL语句

        product_list = db.insert(sql)  # 获取多条记录

        print(product_list)

        # insert_data(username, password, email)
        # return render_template("index.html")
        return redirect(url_for('index'))

    else: #GET
         return render_template("register.html")

@app.route('/login', methods=['GET','POST'])
def login():
    if (request.method == "POST"):
        print("ok")
        username = request.form['username']
        password_candidate = request.form['password']
        print(username)
        sql = "SELECT * FROM users  WHERE name = '%s'" % (username)  # 根据用户名查找user表中记录
        db = MysqlUtil()  # 实例化数据库操作类
        result = db.fetchone(sql)  # 获取一条记录
        print(password_candidate)
        print(result)
        db_password = result['password']  # 用户填写的密码
        if password_candidate == db_password:
            # 写入session
            session['logged_in'] = True
            session['username'] = username

            # return "登录成功"# 跳转到控制台
            return redirect(url_for('index'))
        else:
            print("密码错误")
            return render_template("login_user.html")

    else: #GET
         return render_template("login_user.html")

@app.route('/logout')
def logout():
    session.clear() # 清除Session
    return redirect(url_for('index'))

@app.route('/job')
def job():
    return render_template('job.html')

@app.route('/ajax_get', methods=['GET', 'POST'])
def ajax_data():
    return "这个是来自flask的数据"


@app.route('/get_company', methods=['GET'])
def get_company():
    db = MysqlUtil()

    # 执行SQL查询，获取product_temp表中不同商家的总数
    sql = 'SELECT COUNT(DISTINCT pname) FROM product_temp;'
    product_temp = db.fetchone(sql)  # 获取单条记录

    # 打印查询结果
    print(product_temp)

    db = MysqlUtil()

    # 执行SQL查询，获取product_temp表中不同商家的总数
    sql = 'SELECT COUNT(DISTINCT cname) FROM subcategories;'
    subcategories = db.fetchone(sql)  # 获取单条记录

    # 打印查询结果
    print(subcategories)

    db = MysqlUtil()

    # 执行SQL查询，获取product_temp表中price字段的平均值
    sql = 'SELECT AVG(old_price) AS average_price FROM product_temp;'
    average_price_result = db.fetchone(sql)  # 获取单条记录

    # 打印查询结果
    print(average_price_result)

    # 假设查询结果返回的是一个字典，其中键是 'average_price'
    # 请根据你实际的数据库驱动和MysqlUtil类的实现来调整
    average_price = average_price_result.get('average_price', 0)

    # 获取请求的JSON数据
    json = request.json
    print('recv:', json)

    # 将查询到的商家数量赋值给 company_num
    # 假设查询结果返回的是一个字典，其中键是 'COUNT(DISTINCT company_name)'
    re_data = {
        'company_num': product_temp['COUNT(DISTINCT pname)'],  # 使用查询结果作为 company_num 的值
        'job_num': subcategories['COUNT(DISTINCT cname)'],
        'avg_salary': average_price,
    }
    return jsonify(re_data)
@app.route('/get_industry', methods=['GET'])
def get_industry():
    # 读取CSV文件
    # df = pd.read_csv('./csv/data.csv')
    df = pd.read_csv('./csv/data3.csv', encoding="GB2312")
    # 访问特定的列（例如，'Column1'）
    # print(df['industry_type'])
    industry_type_list = df['industry_type']
    industry_type_value_list = df['industry_type_value']

    industry_type_list = industry_type_list.tolist()
    # industry_type_value_list = json.dumps(industry_type_value_list.tolist())
    industry_type_value_list = industry_type_value_list.tolist()
    re_data = {
           # 'industry_type': ["广东", "广东", "广东"],
           'industry_type': industry_type_list,
           'industry_type_value':  industry_type_value_list,
    }
    print(re_data)
    # re_data = {
    #        'industry_type': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    #        'industry_type_value':  [120, 200, 150, 80, 70, 110, 130],
    # }
    return jsonify(re_data)

@app.route('/Sales', methods=['GET'])
def Sales():

    df = pd.read_csv('./csv/saless.csv', encoding="GB2312")

    industry_recruit_people_type_list = df['industry_recruit_people_type']
    industry_recruit_people_value_list = df['industry_recruit_people_value']

    industry_recruit_people_type_list = industry_recruit_people_type_list.tolist()

    industry_recruit_people_value_list = industry_recruit_people_value_list.tolist()
    re_data = {

           'industry_recruit_people_type': industry_recruit_people_type_list,
           'industry_recruit_people_value':  industry_recruit_people_value_list,
    }
    print(re_data)

    return jsonify(re_data)

@app.route('/average_salary', methods=['GET'])
def average_salary():

    df = pd.read_csv('./csv/average.csv', encoding="GB2312")

    industry_avg_salary_list = df['industry_avg_salary']
    industry_type_list = df['industry_type']

    industry_avg_salary_list = industry_avg_salary_list.tolist()
    industry_type_list = industry_type_list.tolist()
    re_data = {

           'industry_avg_salary': industry_avg_salary_list,
           'industry_type':  industry_type_list,
    }
    print(re_data)

    return jsonify(re_data)

@app.route('/zhanbi', methods=['GET'])
def zhanbi():

    df = pd.read_csv('./csv/zhanbi.csv', encoding="GB2312")

    degree_type_list = df['degree_type']
    degree_value_list = df['degree_value']

    degree_type_list = degree_type_list.tolist()
    degree_value_list = degree_value_list.tolist()
    re_data = {

           'degree_type': degree_type_list,
           'degree_value':  degree_value_list,
    }
    print(re_data)

    return jsonify(re_data)



# app.run(debug=True)
if __name__ == '__main__':
    app.run()