function! autocomplete_swift#generate_keyword_pattern()
    return '\(\.\w*\|\h\w*\)'
endfunction

function! autocomplete_swift#generate_input_pattern()
    return '\(\.\|\(,\|:\|->\)\s*\)\w*'
endfunction

function! autocomplete_swift#convert_placeholder(text)
    let l:text = a:text
    let l:pattern = '<#\%(T##\)\?\%(.\{-}##\)\?\(.\{-}\)#>'
    let l:count = 0

    while 1
        let l:count += 1
        if match(l:text, l:pattern) == -1
            break
        endif

        let l:text = substitute(l:text, l:pattern, '<`' . l:count . ':\1`>', '')
    endwhile

    return l:text
endfunction

function! autocomplete_swift#write_buffer(path)
    call writefile(getline(0, '.'), a:path)
endfunction

function! autocomplete_swift#get_offset(complete_position)
    return line2byte(line('.')) - 1 + a:complete_position
endfunction