from wsgiref.simple_server import make_server

import falcon
from datetime import datetime, timezone, timedelta

MOSCOW_TZ = moscow_timezone = timezone(timedelta(hours=3))


class TimeResource:
    def get_time_string(self):
        return datetime.now(tz=MOSCOW_TZ).strftime("%H:%M:%S")

    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.content_type = falcon.MEDIA_TEXT
        resp.text = f"The current time is: {self.get_time_string()}"


app = falcon.App()

time = TimeResource()

app.add_route("/", time)

if __name__ == "__main__":
    with make_server("", 8000, app) as httpd:
        print("Serving on port 8000...")

        httpd.serve_forever()
