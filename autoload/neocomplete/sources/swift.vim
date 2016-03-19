let s:source = {
\   'name': 'swift',
\   'kind': 'keyword',
\   'filetypes': {
\       'swift': 1,
\   },
\   'mark': '[swift]',
\   'min_pattern_length': 4,
\   'max_candidates': 30,
\   'keyword_patterns': {
\       'swift': autocomplete_swift#generate_keyword_pattern(),
\   },
\   'input_pattern': autocomplete_swift#generate_input_pattern(),
\ }

function! s:source.gather_candidates(context)
    return autocomplete_swift#complete(line('.'), a:context.complete_pos)
endfunction

function! neocomplete#sources#swift#define()
    return sourcekitten#is_installed() ? s:source : {}
endfunction
