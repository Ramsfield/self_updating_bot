import discord
from discord.ext import commands
from discord import app_commands
from json import load
import sys

intents = discord.Intents.default()
bot = commands.Bot(command_prefix='.', intents=intents)

#GLOBAL VAIRABLES
GUILD=None

# START COMMANDS
group = app_commands.Group(name="system", description="System Commands")

@group.command(name="ping", description="Returns Pong")
async def ping(inter: discord.Interaction) -> None:
	await inter.response.send_message(f"Pong! ({round(bot.latency * 1000)}ms) WITH A CHANGE")

@group.command(name="update", description="Updates the bot")
async def update(inter: discord.Interaction) -> None:
	await inter.response.send_message(f"Restarting to update")
	sys.exit(0)

bot.tree.add_command(group)
# END COMMANDS

@bot.event
async def on_ready():
	await bot.tree.sync()
	print("Bot ready")

keys = {}
with open('keys.json') as f:
	keys = load(f)

bot.run(keys["token"])
