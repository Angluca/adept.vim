#### Vim plugin for adept language
```vim
Plug 'angluca/adept.vim'
Plug 'girishji/vimcomplete'
Plug 'yegappan/lsp'
au filetype adept call LspAddServer([#{
            \    name: 'adeptls',
            \    filetype: ['adept'],
            \    path: 'adeptls',
            \    args: ['--infrastructure', $HOME..'/SDK/Adepts/_bin/']
            \  }])
```
You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting for autocomple  
quickly building use ```:make```

