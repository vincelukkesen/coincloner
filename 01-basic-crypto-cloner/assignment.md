# Permanent Evaluation 1 : API consuming service

## Rules

Your code will need to be submitted through GitHub Classroom.

The deadline for committing your code is `Sunday 3 November at 23:59`. Starting from Monday 4 November 00:00, a script will clone your repository with your solution.

__File creation/last edit time is of no relevance at all for this deadline! Your code should be online at this moment in time.__

If for some mysterious reason GitHub should be offline, you are allowed to send it by mail. GitHub uptime will also be monitored.

_This might be obvious, but not having internet access is by no means a reason to not submit your code before the deadline._

## Assignment

We will make use of a public API to retrieve cryptocurrency data. The first part is actually quite easy, clone the last week trading history for all supported coins.

So... what's the catch? First of all there's an API requests/second limit. This is (at the moment of writing) 6 requests/second. Later on I'll provide a test API.

Requirements:

* You retrieve `all supported coins` (not hard-coded!)
* You have some sort of `process that manages how many requests/seconds` can be sent. _NOTE: I want to configure this `dynamically`._
  * This process should keep a queue of "worker requests", this way the load is somewhat distributed evenly
* There is a "`manager`" process that keeps track of all started processes. _NOTE: I want to be able to retrieve a list of all started PID's._
* There is some kind of `logger` process. Every time a "worker" process does a request, there should be some kind of logging. For now it should log on the screen:
  * When the request was executed
  * What coin data is requested (coin, start unix time stamp, end unix timestamp)
* The above 3 processes should be `name registered`
* Then there are the worker processes
  * They send a message to the process that manages requests/second. They want to access the API, but want permission from this process.
  * They receive a message from this process, saying "ok, go and do your request".
  * They do the request and keep the result in their `state`
  * They send the details to the logger. _Keep in mind that when you try to retrieve more than 1000 records, the result is just 1000 records and you do not have all the records in the specified time frame! In this case, only log that your time frame was too big! The next request could be e.g. half the time frame of what you initially requested._
  * I want to be able to do an API call, e.g. `Worker.get_history(worker_pid)`, and retrieve a history in __list__ format. (_Note: The history itself is in a list format, but this API call will return a `tuple` with the first element being the `currencypair` and the second element being the `history` itself).

## Constraints

Following module names are __not__ changeable. __If you don't use these, I can't run my tests and you will get a failing grade!__

* `DaAssignment.Logger`
* `DaAssignment.ProcessManager`
  * I should be able to call the function `retrieve_coin_processes/0` which gives me a `list of tuples`. The first element of a tuple is the currency pair, whereas the second is the `PID` of the CoindataRetriever process.
* `DaAssignment.RateLimiter`
  * `change_rate_limit/1` changes the rate limit. This should be noticeable when the Logger is logging entries.
* `DaAssignment.CoindataRetriever`
  * `get_history/1` retrieves the history of the passed PID. The expected format will be `{"BTC_BTS", [%{...}, %{...}, ...]}`

## _Indication_ that your code is working

Check lib/test/da_assignment_test.exs. Run this with `mix test`.
