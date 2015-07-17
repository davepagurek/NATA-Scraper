# NATA-Scraper
Maintaining the Newgrounds Annual Tournament of Animation site is hard. Let's automate it.

## Usage
```
./nata parse
./nata download
./nata convert
./nata screenshots
```
or
```
perl nata parse
perl nata download
perl nata convert
perl nata screenshots
```

## Config
Add entrant usernames to the `entrant` list to scrape the most recent `moviesToCheck` movies on their Newgrounds profile to find movies tagged with `roundTag`. After running `./nata parse`, manually add swf URLs from Dumping Grounds to `entries.json` for them to be retrieved later.
Change the `swivel` option to the command to run your patched Swivel installation. Change `ffmpeg` to the command to run ffmpeg to generate screenshots.
