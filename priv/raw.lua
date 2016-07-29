counter = 1
wrk.headers["Content-Type"] = "application/json"
wrk.method = "GET"
path = "/api/sessions"

request = function()
  counter = counter + 1

  return wrk.format(nil, path)
end
