# WHAT YOU NEED:

  1.  Modify the `bot.service` with the following (You'll probably need superuser permissions to do this!):  
    - `ExecStart` needs to be pointed to the directory where the `botStartup.sh` script is  
    - `User` and `Group` need to be updated with the UID and GID of your user. You can find this by running the `id` command  
  3. Copy `bot.service` to `/usr/lib/systemd/system` (You'll need superuser permissions to do this! `sudo cp bot.service /usr/lib/systemd/system`)
  4. Modify `botStartup.sh` with the following:  
    - `PYTHON` should be set to `which python`  
    - `PIP` should be set to `which pip`  
    - `WORKING_DIRECTORY` should be set to this directory  
  5. Call `sudo systemctl daemon-reload` to let `systemd` know we have a new unit
  6. (Optional) call `sudo systemctl enable bot.service` to set the bot to always auto start `sudo systemctl disable bot.service` to stop
  7. Call `sudo systemctl start bot.service`

 
# Caveats
  - You should never let code run on your machine that you're not explicitly aware of what it does. If something bad happens, I take no liability
  - This means the bot will always be running. If broken code enters the bot and it can't run at all, the bot will continually pull the code and restart until it succeeds. If, however, the `update` command gets broken and the bot can't register that it should shutdown when that command is given, it'll be broken until you come in and run `systemctl restart bot.service`
  - My bot is using a `keys.json` file. I'm not providing this. :)
