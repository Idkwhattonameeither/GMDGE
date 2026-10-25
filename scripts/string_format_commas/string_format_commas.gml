function string_format_commas(value) {
    var _str = string(floor(value));
    var _out = "";
    var _len = string_length(_str);
    
    for (var i = 1; i <= _len; i++) {
        _out += string_char_at(_str, i);
        if ((_len - i) > 0 && (_len - i) % 3 == 0) {
            _out += ",";
        }
    }
    
    return _out;
}