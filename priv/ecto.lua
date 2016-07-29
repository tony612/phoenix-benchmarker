counter = 1
wrk.headers["Content-Type"] = "application/json"
wrk.method = "POST"
path = "/api/sessions"

request = function()
  body = '{"email": "user' .. counter .. '@stress.test"}'
  wrk.body = body
  counter = counter + 1

  return wrk.format(nil, path)
end
