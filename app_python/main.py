from wsgiref.simple_server import make_server

import falcon
from datetime import datetime, timezone, timedelta

MOSCOW_TZ = moscow_timezone = timezone(timedelta(hours=3))

visits = []

class TimeResource:
    def get_time_string(self):
        return datetime.now(tz=MOSCOW_TZ).strftime("%H:%M:%S")

    def write_time(self, s):
        with open("media/visits", "a") as f:
            f.write(s + "\n")

    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.content_type = falcon.MEDIA_TEXT
        time_string = self.get_time_string()
        resp.text = f"The current time is: {time_string}"
        self.write_time(time_string)
        #visits.append(time_string)

class ViewsResource:
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.content_type = falcon.MEDIA_TEXT
        with open("media/visits") as f:
            resp.text = f.read()



def create():
    app = falcon.App()

    time = TimeResource()
    views = ViewsResource()

    app.add_route("/", time)
    app.add_route("/visits", views)
    return app

if __name__ == "__main__":
    app = create()
    with make_server("", 8000, app) as httpd:
        print("Serving on port 8000...")

        httpd.serve_forever()
