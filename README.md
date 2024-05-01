#### Vim plugin for adept language
```vim
Plug 'angluca/adept.vim'
Plug 'girishji/vimcomplete'
Plug 'yegappan/lsp'

au filetype adept call LspAddServer([#{
            \    name: 'adeptls',
            \    filetype: ['adept'],
            \    path: 'adeptls',
            \    args: ['--infrastructure', $HOME..'/SDK/Adepts/build/']
            \  }])

if has("win32")
let $VIM=$HOME.'/vimfiles/'
else
let $VIM=$HOME.'/.vim/'
endif
au FileType adept let $ADEPT = $HOME.'/SDK/Adept/build/import'
au FileType adept setl tags+=$VIM/bundle/Adept.vim/tags/adept.tags
au FileType adept setl dict+=$VIM/bundle/Adept.vim/tags/adept.dict
au FileType adept setl dict+=$VIM/bundle/Adept.vim/tags/adept.base.dict
```
You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting for autocomple  
quickly building use ```:make```

