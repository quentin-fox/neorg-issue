# Recreation Steps

1. Clone this repo

2. Run setup.sh script

```sh
sh setup.sh
```

3. Once nvim finally opens, do the following:

```ex
:Neorg journal today
:w
:Neorg journal toc open
```

4. It should show that even though the document.meta in the journal entry in the notes/ directory has a `title: ` populated, it doesn't show the title in the TOC
