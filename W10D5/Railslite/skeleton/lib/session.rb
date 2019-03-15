require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)

    if req.cookies["_rails_lite_app"]
      @ds_cookie = JSON.parse(req.cookies["_rails_lite_app"])
    else
      @ds_cookie = {}
    end

  end

  def [](key)
    @ds_cookie[key]
  end

  def []=(key, val)
    @ds_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", { path: '/', value: JSON.generate(@ds_cookie) } )
  end
end
