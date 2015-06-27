# NATA-Scraper
Maintaining the Newgrounds Annual Tournament of Animation site is hard. Let's automate it.

## Usage
```
./nata parse
./nata download
./nata convert
```
or
```
perl nata parse
perl nata download
perl nata convert
```
Change `$round` to scrape `http://www.ngtournament.com/$round` for the entrant list.

It then looks at the `$moviesToCheck` recent movies from each user's Newgrounds page to find movies tagged with `$roundTag`.

## Output
```
Entrants:

AmazingSpin
        Lizardman Xander (NATA2015OPEN)
        http://www.newgrounds.com/portal/view/659337

BooneBum
        Strauss
        http://www.newgrounds.com/portal/view/659456

Britbau
        Third Law
        http://www.newgrounds.com/portal/view/659436

brynimation
        Ten amazing facts!
        http://www.newgrounds.com/portal/view/659430

CarelessShenanigans
        Ten Fabulous Facts!!!
        http://www.newgrounds.com/portal/view/659299

DocJoshimitsu
        NATA Open Round 2015
        http://www.newgrounds.com/portal/view/659365
```
