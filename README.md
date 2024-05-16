# .dotfiles

Those are my dotfiles.

I change the overall setup every now an then, and failed to keep this README up to date
the last few times, so read the files to know what's gonig on. :)

# Neovim

## Keybinds
Non-exhaustive list of keybinds and how I structure them.

- Normal Mode:
    - Comment something (defaults from numToStr/Comment.nvim)
        - **gcc**: line comment current line
        - **gcA**: append comment to current line (goes to insert mode)
    - DAP (Prefix: **\<leader\>d**):
        - **b**: set breakpoint
        - **s**: start / continue
        - **i**: step into
        - **j**: step over
        - **o**: step out
        - **B**: set breakpoint with condition
        - **t**: UI toggle
    - Diagnostics
        - **]d**: next diagnostic
        - **[d**: previous diagnostic
        - **\<leader\>e**: floating diagnostic
        - **\<leader\>q**: diagnostic list (quickfix)
    - Diffview
        - **\<leader\>dv**: DiffviewOpen
        - **\<leader\>dc**: DiffviewClose
    - GitSigns:
        - **\<leader\>h**: stage hunk
        - **\<leader\>h**: restore
        - **]h**: Next hunk
        - **[h**: Previous hunk
    - Go Somewhere (Prefix: **g_**):
        - **gh**: goto header (C, C++)
        - **gH**: goto header under cursor
        - **gd**: goto definition
        - **gD**: goto declaration
        - **gi**: goto implementation
        - **gr**: goto references
        - **gs**: goto type (s for struct, **gt** is occupied for navigating tabs)
        - **gC**: goto context (TreeSitter Context)
    - Harpoon:
        - **\<leader\>a**: Append
        - **C-e**: open list
        - **C-h, C-j, C-k, C-l**: Select buffer
        - **C-S-P, C-S-N**: Previous / Next
    - Jsonpath:
        - **\<leader\>j**: Print JSON path
    - LSP:
        - (see Go Somewhere)
        - **\<leader\>ca**: code action
        - **\<leader\>rn**: rename
        - **K**: hover documentation
    - Noice:
        - **\<leader\>nd**: dismiss messages
    - Oil:
        - **-**: Open parent directory
    - Scribe:
        - **\<leader\>nf**: find note
        - **\<leader\>nn**: new note
        - **\<leader\>no**: open notes
    - Telescope (prefix: **s** for search, no leader, since I don't need **s** default behaviour):
        - **so**: search old files
        - **sb**: search buffers
        - **\<leader\>/** fuzzy find current buffer
        - **sd**: search diagnostics
        - **sa**: search all files
        - **sg**: search git files
        - **sh**: search helptags
        - **ss**: search snippets
        - **sw**: search workspace symbols
    - TODO Comments
        - **]t**: next TODO comment
        - **[t**: previous TODO comment
    - TreeSitter:
        - **vin**: init incremental selection
        - **ni**: increase incremental selection
        - **nd**: decrease incemental selection
    - TreeSitter TextObjects (not actual keybinds, only valid for - well - selecting text objects):

        Those use `i` for inner and `o` for outer, respectively.

        - **a**: parameter
        - **b**: block
        - **c**: call
        - **e**: statement (-> expression)
        - **f**: function
        - **i**: conditional (-> if)
        - **l**: loop
        - **s**: class (-> struct)
        - **t**: comment (-> text)

        above that:

        - **\<leader\>pf**: peek function definition
        - **\<leader\>ps**: peek type definition
- Insert Mode:
    - Completion
        - **C-Space**: open completion
        - **CR**: confirm selection
        - **C-j**: select next item
        - **C-k**: select previous item
        - **C-h**: jump backwards in snippet
        - **C-l**: jump forward in snippet
        - **C-n**: select next choice in snippet choice node
        - **C-p**: select previous choice in snippet choice node
- Visual Mode:
    - Comment something (defaults from numToStr/Comment.nvim)
        - **gc**: comment with line comment
        - **gb**: comment with block comment

