import style from howl.ui

style.define 'longstring', 'string'

class WrenMode
  new: =>
    @lexer = bundle_load('wren_lexer')
    @completers = { 'in_buffer' }

  comment_syntax: '--'

  auto_pairs: {
    '(': ')'
    '[': ']'
    '{': '}'
    '"': '"'
    "'": "'"
  }

  indentation: {
    more_after: {
      r'[({=]\\s*(--.*|)$'
    }

    less_for: {
      '^%s*}'
      r'^\\s*\\}\\b'
    }
  }

  code_blocks:
    multiline: {
    }
