function start_dialogue(_speaker, _lines, _callback = -1)
{
    global.dialogue_active = true;
    global.dialogue_speaker = _speaker;
    global.dialogue_lines = _lines;

    global.dialogue_callback = _callback;
}