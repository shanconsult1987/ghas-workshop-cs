from flask import Flask, request
import subprocess

app = Flask(__name__)


@app.route("/")
def home():
    return "GHAS Workshop"


@app.route("/run")
def run_command():
    command = request.args.get("command")
    result = subprocess.check_output(command, shell=True)
    return result.decode()


@app.route("/evaluate")
def evaluate():
    expression = request.args.get("expression")
    return str(eval(expression))


if __name__ == "__main__":
    app.run()
