-- Creae a new Socket
local socket = require("socket")
local server = assert(socket.bind("*",666))
local ip, port = server:getsockname()

-- Start/Loop Server
while 1 do
    -- Listen for connections..
    local client = server:accept()
    client:settimeout(10)
    local line, err = client:receive()
    -- Send the incoming data back out
    if not err then     
        client:send(line .. "\n") 
    end
    -- Close connection
    client:close()
end