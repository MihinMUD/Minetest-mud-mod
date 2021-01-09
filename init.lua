import discord
import os
import random
import urllib.parse, urllib.request, re
from discord.ext import commands
from configparser import ConfigParser

cp = ConfigParser()
config_name = "index.ini"

if not os.path.isfile(config_name):
    cp['Core'] = {
        'prefix':'mud',
    }
    with open(config_name,'w') as file:
        cp.write(file)
else: 
    pass

cp.read(config_name)
PROTOCAL = "https://"
BASE_URL = "www.youtube.com/"

TOKEN = "NzgzODY4MzIzNjkwNDQ2OTE4.X8hAQw.jMZkLHGKiBDWh7xnSoKW8C_5wvk"
BALL = [
    "It is certain",
    "Without a doubt",
    "You may rely on it",
    "Yes definitely",
    "It is decidedly so",
    "As I see it, yes",
    "Most likely",
    "Yes",
    "Outlook good",
    "Signs point to yes",
    "Reply hazy try again",
    "Better not tell you now",
    "Ask again later",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don’t count on it",
    "Outlook not so good",
    "My sources say no",
    "Very doubtful",
    "My reply is no",
]
PREFIX = cp.get("Core","prefix") + " "
client = commands.Bot(command_prefix=PREFIX  , help_command=None)
@client.event
async def on_ready():
    print('Bot is ready')
    print(PREFIX)

@client.event
async def on_command_error(ctx , error):
    if isinstance(error , commands.CommandNotFound):
        await ctx.send("I dont know how to do that... :thinking:")
    
@client.command()
@commands.has_permissions(administrator=True)
async def leave(ctx):
    await ctx.send("I am leaving this guild!")
    await ctx.guild.leave()




@client.command()
async def help(ctx):
    
    help_embed = discord.Embed(
        title = "Commands",
        description = f"```<something>``` = requierd \n```(something)``` = optional" ,
        colour = discord.Colour.blue()
    )
    help_embed.set_thumbnail(url="https://cdn.discordapp.com/avatars/783868323690446918/d4c332719a1008eecdabc69e957f0713.png?size=256")
    help_embed.add_field(name=":white_check_mark:  ```8ball <question>```", value = "Ask question from magic 8ball!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```about```", value = "See my creator" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```amazed```", value = "Use it when you are Amazed" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```annoy <person>```", value = "Use it when there is a annoying person" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```clr <number>```", value = "Delete messages (only if have permisions)" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```crazy <person>```", value = "Use it when there is a crazy person" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```flip```", value = "flip a coin!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```help```", value = "Show this message" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```hi```", value = "Hi!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```hungry```", value = "Use it when you are hungry" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```lol```", value = "Lol!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```roll```", value = "roll 6 sided dice" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```thanks```", value = "Thank me! :smile:" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```wink```", value = "Wink" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```yay```", value = "Yay!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```laugh```", value = "Laugh!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```say <thing to say>```", value = "Make me repeat something you said!" ,inline=True)
    help_embed.add_field(name=":white_check_mark:  ```ysearch <thing to search>```", value = "Search Somrthing on YT" ,inline=True)
    await ctx.send(embed = help_embed)

@client.command(pass_context=True)
async def amazed(ctx):
    await ctx.send(f"{ctx.message.author.display_name} is Amazed!")
    await ctx.send("https://tenor.com/view/amazed-cat-gif-5025844")
@client.command(pass_context=True)
@commands.has_permissions(administrator=True)
async def clr(ctx, amount=5):
    await ctx.channel.purge(limit=amount)
    await ctx.send(f"{ctx.message.author.display_name} has deleted {amount} messages")

@client.command(aliases=["hello"])
async def hi(ctx):
    hello=[
        "Hi :)",
        "Hello!",
        "hi, Nice to meet you!",
    ]
    await ctx.send(random.choice(hello))


@client.command()
async def roll(ctx):
    rolled = str(random.choice(range(6)))
    if rolled == 0:
        rolled = 1
    else:
        pass
    await ctx.send(f"rolling the dice \n The number is: {str(rolled)}")

@client.command()
async def flip(ctx):
    coin=[
        "Head",
        "Tail"
    ]
    await ctx.send(f"Coin fliped.\n its {random.choice(coin)} !")

@client.command(aliases=["thx" , "ty" ,'thankyou'])
async def thanks(ctx):
    thanks=[
        "Your Welcome!",
        "No problem :)"
    ]
    await ctx.send(random.choice(thanks))

@client.command()
async def crazy(ctx , *,person):
    await ctx.send( f"{person} is crazy.. ")
    await ctx.send("https://media.giphy.com/media/eaECZB7V6GACc/giphy.gif")


@client.command()
async def laugh(ctx ):
    await ctx.send("https://tenor.com/view/despicable-me-minions-laugh-laughing-lol-gif-3571116")

@client.command()
async def about(ctx):
    about_embed = discord.Embed(
        title = "About me..",
        description = "I was created by <@!756868676040392784> ",
        colour = discord.Colour.blue()
    )
    about_embed.set_thumbnail(url= "https://cdn.discordapp.com/avatars/756868676040392784/a2b1b50d8ffd88954da401769b092c36.png?size=256")
    about_embed.add_field(name="What can i do?", value = "I'm a just friendly, fun chat bot! :)" ,inline=False)
    about_embed.add_field(name="How to use me?", value = "Type 'mud help'" , inline=False)
    about_embed.set_author(name="MihinMUD" , icon_url= "https://cdn.discordapp.com/avatars/756868676040392784/a2b1b50d8ffd88954da401769b092c36.png?size=256")
    await ctx.send(embed = about_embed)

@client.command()
async def wink(ctx):
    await ctx.send("https://tenor.com/view/mr-bean-wink-trust-me-%E0%A4%86%E0%A4%81%E0%A4%96-gif-10540459")

@client.command()
async def hungry(ctx):
    await ctx.send("https://tenor.com/view/its-time-to-eat-garfield-knife-and-fork-eating-time-dinner-time-gif-19321135")

@client.command()
async def lol(ctx):
    await ctx.send("lol!")
    await ctx.send("https://tenor.com/view/baby-toddler-laughing-laugh-toppling-gif-4290934")

@client.command()
async def yay(ctx):
    await ctx.send("Yay!")

@client.command()
async def ysearch(ctx, *, search):
    query_string = urllib.parse.urlencode({'search_query': search})
    htm_content = urllib.request.urlopen('http://www.youtube.com/results?' + query_string)
    search_results = re.findall(r'/watch\?v=(.{11})',
    htm_content.read().decode())
    await ctx.send('http://www.youtube.com/watch?v=' + search_results[0])

@client.command()
async def say(ctx,*,thing):
    await ctx.send(thing)

@client.command()
async def annoy(ctx , *,person):
    await ctx.send(f"{person} is very annoying")
    await ctx.send("https://tenor.com/view/nope-monkey-laptop-angry-furious-gif-7316263")


@client.command(aliases=["8ball"])
async def _8ball(ctx , *, question):
    await ctx.send(f"Question: {question}\nAnswer: {random.choice(BALL)}")
    
@client.command()
@commands.has_permissions(administrator=True)
async def chprefix(ctx,*,prefix):
    cp.set('Core','prefix',prefix)
    with open(config_name,'w') as file:
        cp.write(file)

    cp.read(config_name)
    await ctx.send(f'prefix changed to {prefix}')


client.run(TOKEN)
