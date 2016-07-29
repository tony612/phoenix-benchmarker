# Phoenix Benchmarker

## Prepare

```
$ mix do deps.get, compile
$ MIX_ENV=prod mix ecto.migrate
$ MIX_ENV=prod mix compile.protocols
$ MIX_ENV=prod elixir -pa _build/prod/consolidated -S mix phoenix.start
```

## Benchmark

### Without ecto

```
$ wrk -t4 -c100 -d30S --timeout 2000 --script=priv/raw.lua --latency "http://127.0.0.1:8080/api/sessions"
Running 30s test @ http://127.0.0.1:8080/api/sessions
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    14.44ms   17.55ms 200.20ms   89.59%
    Req/Sec     2.25k   685.08     5.05k    71.64%
  Latency Distribution
     50%    8.94ms
     75%   17.85ms
     90%   32.76ms
     99%   90.82ms
  267808 requests in 30.06s, 65.18MB read
Requests/sec:   8909.64
Transfer/sec:      2.17MB
```

### With Ecto

```
$ wrk -t4 -c100 -d30S --timeout 2000 --script=priv/ecto.lua --latency "http://127.0.0.1:8080/api/sessions"
Running 30s test @ http://127.0.0.1:8080/api/sessions
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    40.88ms   32.98ms 361.59ms   90.49%
    Req/Sec   690.92    235.34     1.21k    70.82%
  Latency Distribution
     50%   32.41ms
     75%   46.20ms
     90%   69.49ms
     99%  188.53ms
  81745 requests in 30.08s, 24.76MB read
Requests/sec:   2718.02
Transfer/sec:    842.99KB
```
