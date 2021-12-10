# Credits to: ramirez.#6426
### Skid's Api


_Skid's Api, is a library with all you need!_

~~[Discord Server](https://discord.gg/q8FspVseAU)~~

## Features

- Code optimized
- No lag
- Supports KRNL, Synapse, Script-Ware
- Easier to configure
- Version 3.5 **ALPHA**
- Game Logger
- Logs user's id
- Fixed Bugs
- New Format(Design)
- User's thumbnail

### how to use?



```lua
skidApi = loadstring(game:HttpGet('https://raw.githubusercontent.com/Ramirez1001/Skid-s-Api/main/main.lua'))()

skidApi:sendWebhook('Your WebhookURL', ...) -- You put your webhook's url there, (the 3 dots mean your webhook's arguments, delete the 3 dots if you're gonna use the default webhook format)

```

### How can i change the webhook's json?

```lua


skidApi.webhookJson = function(example)

-- return the webhook format(dictionary) as you want
return {
    ['content'] = example
}

end

skidApi:sendWebhook('Your WebhookURL', 'this is a example!')

```

### Original Format

```lua
-- you can name the variable as you want!
skidApi = loadstring(game:HttpGet('https://raw.githubusercontent.com/Ramirez1001/Skid-s-Api/main/main.lua'))()

skidApi:sendWebhook('Your WebhookURL')
```

### How to use game logger?

```lua
skidApi = loadstring(game:HttpGet('https://raw.githubusercontent.com/Ramirez1001/Skid-s-Api/main/main.lua'))()

skidApi:sendWebhookGame('Your WebhookURL','Viva Mexico!')
```

### Example of how does it looks like

![GAME LOG](https://media.discordapp.net/attachments/854902177578221580/917238485457457152/unknown.png "GAME LOG")


![DATA LOG](https://media.discordapp.net/attachments/854902177578221580/917240112427986984/unknown.png "DATA LOG")
