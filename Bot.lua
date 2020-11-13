local Discordia = require("discordia")
local client = Discordia.Client()
local dogPics = {
    {"acting dog", "https://upload.wikimedia.org/wikipedia/commons/4/43/Ace_The_Wonder_Dog.jpg"},
    {"sledding dogs", "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/The_dogs_tethered_out_at_The_Grottoes.jpg/800px-The_dogs_tethered_out_at_The_Grottoes.jpg"},
    {"Flickr user nickobec (Nick Cowie), CC BY-SA 2.0\nhttps://creativecommons.org/licenses/by-sa/2.0, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Blue_merle_Border_Collie.jpg/800px-Blue_merle_Border_Collie.jpg"},
    {"MegaAussies9, CC BY-SA 3.0\nhttp://creativecommons.org/licenses/by-sa/3.0/, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/c/ca/Able_12_weeks_with_max_078.jpg"},
    {"Rainer Spickmann, CC BY-SA 2.5\nhttps://creativecommons.org/licenses/by-sa/2.5, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/b/b7/Langhaardackel_merlin_2005.jpg"},
    {"Bodlina, CC BY-SA 3.0\nhttp://creativecommons.org/licenses/by-sa/3.0/, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/5/57/7weeks_old.JPG"},
    {"Bev Sykes from Davis, CA, USA, CC BY 2.0\nhttps://creativecommons.org/licenses/by/2.0, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/8/8c/Sleeping_Pups.jpg"},
    {"Thomas Zimmermann (THWZ), CC BY-SA 3.0 DE\nhttps://creativecommons.org/licenses/by-sa/3.0/de/deed.en, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/c/cb/Vorderkoerpertiefstellung_THWZ.jpg"},
    {"aussiegall from sydney, Australia, CC BY 2.0\nhttps://creativecommons.org/licenses/by/2.0, via Wikimedia Commons", "https://upload.wikimedia.org/wikipedia/commons/8/80/There%2C_is_that_a_big_enough_smile_for_the_camera%3F_%286471115817%29.jpg"},
    {"snow dog", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Afra_011.jpg/800px-Afra_011.jpg"}
}

client:on("messageCreate", function(message)

    if message.channel.type == 0 or message.channel.type == 4 then

        if message.author.bot == false and message.content == "random dog" and message.guild.me:getPermissions(message.channel):has("sendMessages", "attatchFiles") then

            local decider = math.random(#dogPics)

            message.channel:send {
                embed = {
                    description = dogPics[decider][1],
                    image = {
                        url = dogPics[decider][2]
                    }
                }
            }
        elseif message.content == "random dog" then
            message.author:send("Sorry, I don't have permission to send a dog image in that channel.")
        end

    elseif message.channel.type == 3 or message.channel.type == 1 and message.author.bot == false and message.content == "random dog" then
        local decider = math.random(#dogPics)
        message.channel:send {
            embed = {
                description = dogPics[decider][1],
                image = {
                    url = dogPics[decider][2]
                }
            }
        }
    end
end)

client:run("Bot YourBotTokenHere")
