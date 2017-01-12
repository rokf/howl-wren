howl.util.lpeg_lexer ->
  c = capture


  keyword = c 'keyword', word {
    'break','class','construct','else','for','foreign','if',
    'import','in','is','return',
    'static','super','this','var','while'
  }

  comment = c 'comment', '//' * scan_until(eol)

  string = c 'string', span('"', '"', P'\\')

  operator = c 'operator', S'+-*!/%^#~=<>;:,.(){}[]'

  -- numbers
  hexadecimal_number = P'0x' * R('AF','af','09')^1
  float = digit^0 * P'.' * digit^1

  number = c 'number', any {
    hexadecimal_number,
    (float + digit^1) * (S'eE' * P('-')^0 * digit^1)^0
  }

  -- identifiers
  ident = (alpha + '_')^1 * (alpha + digit + '_')^0
  class_name = upper * (alpha + digit + '_')^0
  field_name = '_' * (alpha + digit + '_')^0
  identifier = c 'identifier', ident
  class_c = c 'class', class_name
  field = c 'field', field_name

  -- constant = c 'constant', upper^1 * any(upper, '_', digit)^0 * any(eol, -#lower)

  special = c 'special', any {
    'true',
    'false',
    'null'
  }

  -- ws = c 'whitespace', blank^0

  any {
    number,
    string,
    comment,
    operator,
    special,
    keyword,
    -- constant,
    identifier,
    class_c,
    field
  }
