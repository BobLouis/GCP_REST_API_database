import http.client

conn = http.client.HTTPSConnection(
    "bark-bark-api-service-sqr6zjoxla-de.a.run.app")

payload = "{\"name\":\"CK02\",\"lifeExpectancy\":3,\"type\":\"sporting\",\"origin\":\"Taiwan\"}\n\t"

headers = {
    'content-type': "application/json",
    'cache-control': "no-cache",
    'postman-token': "4f2f8225-ad0b-037f-7cf3-6b0447937c5a"
}

conn.request("POST", "/", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
