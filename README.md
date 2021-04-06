![ultimate-vim-config](img/ultimate-vim-config.png)

---

Over the last 10 years, I have used and tweaked Vim. This configuration is the ultimate vim configuration or at least my version of it.

## Installation

```bash
$ git clone --depth=1 https://github.com/austinyhc/dotvim.git ~/.vim
$ make init
```
## Integration Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience.

- [nerdtree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
- [tagbar](https://github.com/preservim/tagbar): A class outline viewer for Vim
- [vim-fugitive](https://github.com/tpope/vim-fugitive): Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim.
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
- [delimitMate](https://github.com/Raimondi/delimitMate): Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi): Multiple cursors plugin for vim/neovim
- [vim-move](https://github.com/matze/vim-move): Plugin to move lines and selections up and down
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits 
- [vim-tmux-runner](https://github.com/christoomey/vim-tmux-runner): Vim and tmux, sittin' in a tree... 

## Color Scheme Plugins

- [vim-cpp-modern](https://github.com/bfrg/vim-cpp-modern): Extended Vim syntax highlighting for C and C++ (C++11/14/17/20) 
- [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight): Additional Vim syntax highlighting for C++ (including C++11/14/17)

## Command Plugins

- [targets.vim](https://github.com/wellle/targets.vim): Vim plugin that provides additional text objects
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister): Replace text with the contents of a register
- [vim-titlecase](https://github.com/christoomey/vim-titlecase): Teach Vim about titlecase, with support for motions and text objects
- [tcomment_vim](https://github.com/tomtom/tcomment_vim): An extensible & universal comment vim-plugin that also handles native vim motions
- [vim-repeat](https://github.com/tpope/vim-repeat): Enable repeating supported plugin maps with "."
- [vim-radical](https://github.com/glts/vim-radical): radical.vim ✊ Convert decimal, hex, octal, binary number representations 
- [vim-magnum](https://github.com/glts/vim-magnum): Pure Vim script big integer library
- [vim-tabular](http://vimcasts.org/episod): Vim script for text filtering and alignment
- [vim-system-copy](https://github.com/christoomey/vim-system-copy): Vim plugin for copying to the system clipboard with text-objects and motions
- [vim-textobj-user](https://github.com/kana/vim-textobj-user): Create your own text objects

## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

```
nmap <leader>w :w!<cr>
```

Useful mappings for managing tabs:

```
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
```

### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):

```
map <leader>o :BufExplorer<cr>
```

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<leader>j` or `<ctrl>f`):

```
" Quickly find and open a file in the CWD
let g:ctrlp_map = '<C-f>'

" Quickly find and open a recently opened file
map <leader>f :MRU<CR>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>
```

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

```
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
```

## Looking for a remote-first job?

Maintaining this configuration isn't my day job. Daily I am the founder/CEO of SensorAI. You could come and help us build the workspace of the future while living a balanced life (anywhere in the world 🌎🌍🌏).

PS: Using Vim isn't a requirement 😁
