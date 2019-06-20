
function serversocket(port)
    -- Creae a new Server Socket
    local socket = require("socket")
    local server = assert(socket.bind("*",port))
    local _, port = server:getsockname()

    print("Server Listening Port: " .. tostring(port))

    return server
end

local app = serversocket(8989)

-- Start/Loop Server
while 1 do

    local client = app:accept() -- Listen for connections
    client:settimeout(3) -- Disconnect after x seconds
    local line, err = client:receive() 

    -- Send the incoming data back out
    if not err then     
        client:send(line .. "\n") 
    end

    local peer_name = client:getpeername() -- Hostname
    local stats = client:getstats() -- Number of bytes received

    print(stats)

    -- Close connection
    client:close()

end