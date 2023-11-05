import requests
import matplotlib.pyplot as plt
import datetime
import io
import base64

def get_weather(lon,lat,borough):
    weekdays = ["Mon", "Tue", "Wed", "Thu","Fri","Sat","Sun"]

    response = requests.get(f"https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&appid=f9a87010c48060eee4966ecca74f063a&exclude=current,minutely,hourly&units=metric")
    week = response.json()["daily"]
    data = [day["temp"]["day"] for day in week]
    now = datetime.datetime.today().weekday()
    rotated_week = weekdays[now:] + weekdays[:now] + [weekdays[now]+" "]
    plt.clf()
    plt.ylim([-5,25])
    plt.plot(rotated_week,data,color="blue")
    plt.scatter(rotated_week,data,color="blue")
    for i in range(8):
        plt.text(i,data[i]+1,data[i])
    plt.fill_between(rotated_week,data,alpha=0.25,color="blue")
    plt.title(f"Temperature forecast for {borough} \n (Mid-day, Celsius)")
    my_stringIObytes = io.BytesIO()
    plt.savefig(my_stringIObytes, format='png')
    my_stringIObytes.seek(0)
    img = base64.b64encode(my_stringIObytes.read())
    return img


def current_weather(lon,lat):
    try:
        response = requests.get(f"https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&appid=f9a87010c48060eee4966ecca74f063a&exclude=current,minutely,hourly&units=metric")

        print(response.json())
        week = response.json()["daily"]

        data = [day["temp"]["day"] for day in week]

        return (True, data[0])
    except:
        return (False, "")


#print(get_weather())