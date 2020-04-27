from flask import Flask, request
from datetime import datetime

app = Flask(__name__)


@app.route("/api/v1/echo", methods=["POST"])
def echo():
    print("--\n{}".format(datetime.now()))
    print(request.get_data().decode("utf-8"))
    return "OK", 200


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
