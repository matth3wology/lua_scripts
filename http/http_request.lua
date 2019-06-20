-- Basic Socket.HTTP LUA requests

local io = require("io")
local http = require("socket.http")
local ltn12 = require("ltn12")
local mime = require("mime")

function http_print(url_str)
    -- Request and print to STDOUT
    http.request{
        url = url_str,
        sink = ltn12.sink.file(io.stdout)
    }
end


function get_html(url)
    -- Another returning HTML if good server code
    html, server_response = http.request(url)
    if server_response == 200 then
        return html
    end
end


--local html = get_html("http://www.example.com")
--print(html)

function http_basic_auth(url_string,user,pass)
    -- Basic Header Example
    data = http.request{
        url = url_string,
        headers = { 
            authentication = "Basic " .. mime.b64(user..":"..pass),
        }
    }
    print(data)
end

http_basic_auth("http://127.0.0.1","matth3wology","12345lol")