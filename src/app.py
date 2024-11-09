from flask import Flask, render_template, request

# Create an instance of the Flask class
app = Flask(__name__)

# Define the home route
@app.route('/')
def home():
    return "<h1>Welcome to My Simple Web App</h1><p>Navigate to /greet to see a greeting message!</p>"

# Define a route to display a greeting
@app.route('/greet', methods=['GET', 'POST'])
def greet():
    if request.method == 'POST':
        name = request.form.get('name')
        return f"<h1>Hello, {name}!</h1>"
    return '''
        <form method="post">
            <label for="name">Enter your name:</label><br>
            <input type="text" id="name" name="name"><br><br>
            <input type="submit" value="Greet Me">
        </form>
    '''

# Run the app
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

